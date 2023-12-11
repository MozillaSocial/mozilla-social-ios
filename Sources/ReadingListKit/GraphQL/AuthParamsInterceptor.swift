// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import Apollo

class AuthParamsInterceptor: ApolloInterceptor {
    var id: String

    private let sessionProvider: ReadingListSessionProvider
    private let consumerKey: String

    init(
        sessionProvider: @escaping ReadingListSessionProvider,
        consumerKey: String
    ) {
        self.sessionProvider = sessionProvider
        self.consumerKey = consumerKey
        self.id = ""
    }

    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) where Operation: GraphQLOperation {
        do {
            request.graphQLEndpoint = try appendAuthorizationQueryParameters(to: request.graphQLEndpoint)
        } catch {
            completion(.failure(error))
            return
        }

        chain.proceedAsync(request: request, response: response, completion: completion)
    }

    private func appendAuthorizationQueryParameters(to url: URL) throws -> URL {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return url
        }

        var items = components.queryItems ?? []
        items.append(contentsOf: [
            URLQueryItem(name: "consumer_key", value: consumerKey),
        ])

        let session = try sessionProvider()
        items.append(URLQueryItem(name: "guid", value: session.guid))
        items.append(URLQueryItem(name: "access_token", value: session.token))

        components.queryItems = items

        return components.url ?? url
    }
}
