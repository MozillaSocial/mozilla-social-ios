// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import DiscoverKit
import MoSoAnalytics
import MoSoCore
import SwiftUI

// TODO: this is a barebone example for now. Session will be received from login and auth services as needed
struct AppConfigurator {
    let session: MoSoSession
    let analyticsProvider: AnalyticsProvider
    let discoverProvider: DiscoverProvider
    let braze: MoSoBraze

    var loggedIn: Bool {
        session.isLoggedIn
    }

    init() {
        session = MoSoSession()
        analyticsProvider = AnalyticsProvider(session: session)
        discoverProvider  = DiscoverProvider(session: session, tracker: analyticsProvider.makeDiscoverTracker())
        braze = MoSoBraze(
            apiKey: Keys.shared.brazeAPIKey,
            endpoint: Keys.shared.brazeAPIEndpoint,
            groupId: Keys.shared.groupID
        )
        // TODO: replace this with actual user coming from login
        login(user: MoSoUser(username: "test-user@mozilla.com", identifier: "12345678"))
    }

    func login(user: MoSoUser) {
        session.loggedIn(user)
        braze.changeUser(userId: user.identifier, email: user.username)
    }

    func logout() {
        session.loggedOut()
    }

    @MainActor
    func makeDiscoverTab() -> some View {
        discoverProvider.makeDiscoverRootView()
    }
}
