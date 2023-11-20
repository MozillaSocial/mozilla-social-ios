// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import Apollo

enum ReadingListEndpointError: Error {
    case couldNotLoadValidEndpointURL
}

extension ApolloClient {
    static func createDefault(
        sessionProvider: @escaping ReadingListSessionProvider,
        consumerKey: String
    ) -> ApolloClient {
        // guard let url = URL(string: ApolloClient.endpointURLString()) else { fatalError() }
        let url = URL(string: "https://api.getpocket.com/graphql")!

        let authParams = AuthParamsInterceptor(
            sessionProvider: sessionProvider,
            consumerKey: consumerKey
        )
        let store = ApolloStore()
        let interceptorProvider = PrependingUnauthorizedInterceptorProvider(
            prepend: authParams,
            base: DefaultInterceptorProvider(store: store)
        )
        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: interceptorProvider,
            endpointURL: url
        )

        return ApolloClient(networkTransport: networkTransport, store: store)
    }

    static private func endpointURLString() -> String {
        let environmentURLString = ProcessInfo.processInfo.environment["POCKET_CLIENT_API_URL"]
        let bundleURLString = Bundle.main.infoDictionary?["PocketAPIBaseURL"] as? String

        return environmentURLString ?? bundleURLString ?? "https://api.getpocket.com/graphql"
    }

    func fetch<Query: GraphQLQuery>(query: Query, queue: DispatchQueue = .global(qos: .utility)) async throws -> GraphQLResult<Query.Data> {
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<GraphQLResult<Query.Data>, Error>) in
            _ = fetch(query: query, queue: queue) { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let data):
                    guard let errors = data.errors,
                            !errors.isEmpty else {
                        continuation.resume(returning: data)
                        return
                    }
                    // Even though we had errors, let's continue forward for now, it should be up to the individual query executor to use what data we could since GraphQL can return partial responses
                    continuation.resume(returning: data)
                }
            }
        }
    }
}
