// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import Apollo
import MoSoCore

protocol Session {
    var guid: String { get }
    var accessToken: () -> String { get }
}

protocol SessionProvider {
    var session: Session? { get }
}

public protocol AccessTokenProvider {
    var accessToken: String? { get }
}

class AuthParamsInterceptor: ApolloInterceptor {
    var id: String

    private let sessionProvider: () -> MoSoSession
    private let consumerKey: String

    init(
        sessionProvider: @escaping () -> MoSoSession,
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

        let session = sessionProvider()
        items.append(URLQueryItem(name: "guid", value: session.guid))
        items.append(URLQueryItem(name: "access_token", value: session.token))

        components.queryItems = items

        return components.url ?? url
    }
}
