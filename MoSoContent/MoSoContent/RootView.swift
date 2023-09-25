// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import DiscoverKit
import ReadingListKit
import SwiftUI

struct RootView: View {
    let configurator: AppConfigurator

    var body: some View {
        TabView {
            configurator.makeDiscoverTab()
                .tabItem {
                    Label("Discover", systemImage: "safari")
                }
            ReadingListView()
                .tabItem {
                    Label("My List", systemImage: "list.bullet.circle")
                }
        }
        .accentColor(Color("AccentColor"))
    }
}

#Preview {
    RootView(configurator: AppConfigurator())
}
