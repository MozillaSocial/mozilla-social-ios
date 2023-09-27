//// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import DiscoverKit
import MoSoCore
import SwiftUI

// TODO: this is a barebone example for now. Session will be received from login and auth services as needed
struct AppConfigurator {
    let discoverProvider = DiscoverProvider(session: MoSoSession(isLoggedIn: true))

    @MainActor
    func makeDiscoverTab() -> some View {
        discoverProvider.makeDiscoverRootView()
    }
}
