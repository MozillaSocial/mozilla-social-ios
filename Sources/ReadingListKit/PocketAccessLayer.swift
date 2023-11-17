// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import Apollo
import MoSoCore

class PocketAccessLayer {
    var sessionProvider: () -> MoSoSession
    let consumerKey: String
    var apolloClient: ApolloClient?

    init(_ authTokenProvider: @escaping () -> MoSoSession, _ consumerKey: String) {
        self.sessionProvider = authTokenProvider
        self.consumerKey = consumerKey
    }

    func initApolloClient() {
        self.apolloClient = ApolloClient.createDefault(sessionProvider: sessionProvider, consumerKey: consumerKey)
    }

    func getSaves() {
        let pagination = PocketGraph.PaginationInput(after: "0", first: 20)
        let query = PocketGraph.FetchSavesQuery(
            pagination: .some(pagination),
            savedItemsFilter: .some(PocketGraph.SavedItemsFilter(status: .init(.unread)))
        )

        apolloClient?.fetch(query: query) { result in
            print(result)
        }
    }
}
