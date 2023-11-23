// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import Apollo

public protocol ReadingListSession {
    var token: String { get }
    var guid: String { get }
}

public typealias ReadingListSessionProvider = () throws -> ReadingListSession

enum PALError: Error {
    case failedToFetchList(_ reason: String)
    case failedToFetchItem(_ itemURLString: String)
    case invalidAuthentication
}

enum PALState {
    case idle
    case fetching
}

class PocketAccessLayer {
    let consumerKey: String
    let pageSize: GraphQLNullable<Int> = GraphQLNullable<Int>(integerLiteral: 20)
    var apolloClient: ApolloClient?
    var pagination: PocketGraph.PaginationInput
    var sessionProvider: ReadingListSessionProvider

    private(set) var state: PALState = .idle

    weak var delegate: ReadingListModelDelegate?

    init(_ authTokenProvider: @escaping ReadingListSessionProvider, _ consumerKey: String) {
        self.sessionProvider = authTokenProvider
        self.consumerKey = consumerKey
        self.pagination = PocketGraph.PaginationInput(after: .none, first: pageSize)
    }

    func initApolloClient() {
        self.apolloClient = ApolloClient.createDefault(sessionProvider: sessionProvider, consumerKey: consumerKey)
    }

    // MARK: - Fetch Saves

    func fetchSaves() {
        if state == .fetching { return }
        state = .fetching

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
                    let urlStrings = self.renderURLsFromResponse(from: savedItems)
                    self.delegate?.didFetchReadingListItems(urlStrings: urlStrings, totalItemCount: savedItems.totalCount)

                    let cursor: String? = data.data?.user?.savedItems?.pageInfo.endCursor
                    self.updatePagination(with: cursor)
                }
            case .failure(let error):
                self?.delegate?.operationFailed(with: .failedToFetchList("Fetch Query failed due to error: \(error)"))
            }
        }
    }

    func getItemForURL(_ urlString: String) async throws -> PocketGraph.ItemByURLQuery.Data.ItemByUrl {
        let query = PocketGraph.ItemByURLQuery(url: urlString)

        let data = try await apolloClient?.fetch(query: query)
        guard let item = data?.data?.itemByUrl else { throw PALError.failedToFetchItem(urlString) }

        return item
    }

    private func renderURLsFromResponse(from savedItems: PocketGraph.FetchSavesQuery.Data.User.SavedItems) -> [String] {
        guard let edges = savedItems.edges else {
            return []
        }

        return edges.compactMap { $0?.node?.url }
    }

    func updatePagination(with cursor: String?) {
        if let cursor = cursor {
            pagination.after = .some(cursor)
        } else {
            pagination.after = .none
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
