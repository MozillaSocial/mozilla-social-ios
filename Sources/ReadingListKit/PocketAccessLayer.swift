// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import Apollo
import MoSoCore

// MARK: - Types

public protocol ReadingListSession {
    var token: String { get }
    var guid: String { get }
}

protocol PocketAccessLayerProtocol {
    var delegate: ReadingListModelDelegate? { get set }

    func fetchSaves(after cursor: String?)
    func getItemForURL(_ urlString: String) async throws -> PocketItem
    func archive(item: String)
}

public typealias ReadingListSessionProvider = () throws -> ReadingListSession

enum PocketAccessLayerError: Error {
    case failedToFetchList(_ reason: String)
    case failedToFetchItem(_ itemURLString: String)
    case invalidAuthentication
}

enum PocketAccessLayerState {
    case idle
    case fetching
}

// MARK: - Implementation

class PocketAccessLayer: PocketAccessLayerProtocol {
    private let consumerKey: String
    private let pageSize: GraphQLNullable<Int> = GraphQLNullable<Int>(integerLiteral: 20)
    private var apolloClient: ApolloClient?
    private var sessionProvider: ReadingListSessionProvider
    private(set) var state: PocketAccessLayerState = .idle

    weak var delegate: ReadingListModelDelegate?

    init(_ authTokenProvider: @escaping ReadingListSessionProvider, _ consumerKey: String) {
        self.sessionProvider = authTokenProvider
        self.consumerKey = consumerKey
        self.apolloClient = ApolloClient.createDefault(sessionProvider: sessionProvider, consumerKey: consumerKey)
    }

    // MARK: - Fetch Saves

    func fetchSaves(after cursor: String?) {
        if state == .fetching { return }
        state = .fetching

        let pagination = pagination(with: cursor)

        let query = PocketGraph.FetchSavesQuery(
            pagination: .some(pagination),
            savedItemsFilter: .some(PocketGraph.SavedItemsFilter(status: .init(.unread)))
        )

        apolloClient?.fetch(query: query) { [weak self] result in
            defer {
                self?.state = .idle
            }

            switch result {
            case .success(let data):
                if let errors = data.errors, errors.isEmpty == false {
                    self?.delegate?.operationFailed(with: .failedToFetchList("Successful response with errors"))
                    return
                }

                guard let savedItems = data.data?.user?.savedItems else {
                    self?.delegate?.operationFailed(with: .failedToFetchList("Nil data retrieved"))
                    return
                }

                if let self = self {
                    let cursor: String? = data.data?.user?.savedItems?.pageInfo.endCursor
                    let urlStrings = self.renderURLsFromResponse(from: savedItems)
                    self.delegate?.didFetchReadingListItems(urlStrings: urlStrings, totalItemCount: savedItems.totalCount, cursor: cursor)
                }
            case .failure(let error):
                if case MoSoSessionError.userNotLoggedIn = error {
                    self?.delegate?.operationFailed(with: .invalidAuthentication)
                } else if case MoSoSessionError.userSessionInvalid = error {
                    self?.delegate?.operationFailed(with: .invalidAuthentication)
                } else {
                    self?.delegate?.operationFailed(with: .failedToFetchList("Fetch Query failed due to error: \(error)"))
                }
            }
        }
    }

    func getItemForURL(_ urlString: String) async throws -> PocketItem {
        let query = PocketGraph.ItemByURLQuery(url: urlString)

        let data = try await apolloClient?.fetch(query: query)
        guard let item = data?.data?.itemByUrl else { throw PocketAccessLayerError.failedToFetchItem(urlString) }

        return item
    }

    private func renderURLsFromResponse(from savedItems: PocketGraph.FetchSavesQuery.Data.User.SavedItems) -> [String] {
        guard let edges = savedItems.edges else {
            return []
        }

        return edges.compactMap { $0?.node?.url }
    }

    func pagination(with cursor: String?) -> PocketGraph.PaginationInput {
        if let cursor = cursor {
            return PocketGraph.PaginationInput(after: .some(cursor), first: pageSize)
        } else {
            return PocketGraph.PaginationInput(after: .none, first: pageSize)
        }
    }

    // MARK: - Archive Item

    func archive(item: String) {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions.insert(.withFractionalSeconds)

        let mutation = PocketGraph.ArchiveItemMutation(givenUrl: item, timestamp: dateFormatter.string(from: .now))
        apolloClient?.perform(mutation: mutation) { [weak self] result in
            switch result {
            case .success(let data):
                self?.delegate?.removeItemFromList(item: item)
            case .failure(let error):
                print(error)
            }
        }
    }
}
