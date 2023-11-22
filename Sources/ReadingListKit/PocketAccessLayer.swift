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
    case failedToFetchItem(_ itemURLString: String)
}

class PocketAccessLayer {
    let consumerKey: String
    let pageSize: GraphQLNullable<Int> = GraphQLNullable<Int>(integerLiteral: 20)
    var apolloClient: ApolloClient?
    var pagination: PocketGraph.PaginationInput
    var sessionProvider: ReadingListSessionProvider

    weak var delegate: ReadingListModelDelegate?

    init(_ authTokenProvider: @escaping ReadingListSessionProvider, _ consumerKey: String) {
        self.sessionProvider = authTokenProvider
        self.consumerKey = consumerKey
        self.pagination = PocketGraph.PaginationInput(after: .none, first: pageSize)
    }

    func initApolloClient() {
        self.apolloClient = ApolloClient.createDefault(sessionProvider: sessionProvider, consumerKey: consumerKey)
    }

    func getSaves() {
        let query = PocketGraph.FetchSavesQuery(
            pagination: .some(pagination),
            savedItemsFilter: .some(PocketGraph.SavedItemsFilter(status: .init(.unread)))
        )

        apolloClient?.fetch(query: query) { [weak self] result in
            switch result {
            case .success(let data):
                if let errors = data.errors, errors.isEmpty == false {
                    print("GraphQL 'succeeded' with errors:")
                    errors.forEach { error in
                        print(error)
                    }

                    return
                }

                guard let savedItems = data.data?.user?.savedItems else {
                    print("Unable to parse savedItems from data")
                    return
                }

                print("GraphQL Fetch Success \(String(describing: data.data?.user?.savedItems?.totalCount))")

                if let self = self {
                    let urlStrings = self.renderURLsFromResponse(from: savedItems)
                    self.delegate?.readingListDidLoad(urlStrings: urlStrings, totalItemCount: savedItems.totalCount)
                }

            case .failure(let error):
                print("GraphQL Failed with Error: \(error)")
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
}
