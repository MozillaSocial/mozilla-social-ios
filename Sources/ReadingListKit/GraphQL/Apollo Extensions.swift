// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import Apollo
import MoSoCore

extension ApolloClient {
    static func createDefault(
        sessionProvider: @escaping () -> MoSoSession,
        consumerKey: String
    ) -> ApolloClient {
        let urlStringFromEnvironment = ProcessInfo.processInfo.environment["POCKET_CLIENT_API_URL"]
        let urlStringFromBundle = Bundle.main.infoDictionary?["PocketAPIBaseURL"] as? String
        let urlString = urlStringFromEnvironment ?? urlStringFromBundle ?? "https://api.getpocket.com/graphql"
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
}
