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
        self.id = "Test"
    }

    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) where Operation: GraphQLOperation {
        request.graphQLEndpoint = appendAuthorizationQueryParameters(to: request.graphQLEndpoint)
        chain.proceedAsync(request: request, response: response, completion: completion)
    }

    private func appendAuthorizationQueryParameters(to url: URL) -> URL {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
//            Log.capture(message: "Error - could not break Apollo url into components")
            return url
        }

        var items = components.queryItems ?? []
        items.append(contentsOf: [
            URLQueryItem(name: "consumer_key", value: consumerKey),
        ])

        do {
            let session = try sessionProvider()
            items.append(URLQueryItem(name: "guid", value: session.guid))
            items.append(URLQueryItem(name: "access_token", value: session.token))
        } catch {
            print("Error: \(error)")
        }

        components.queryItems = items

        return components.url ?? url
    }
}
