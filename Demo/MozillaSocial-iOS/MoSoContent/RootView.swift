// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import DiscoverKit
import DesignKit
import ReadingListKit
import SwiftUI

struct RootView: View {
    @State private var selection: Tab = .discover
    let configurator: AppConfigurator

    var body: some View {
        TabView(selection: $selection) {
            Group {
                configurator.makeDiscoverTab()
                    .tabItem {
                        TabIcon(
                            imageName: selection.discoverImageName,
                            accessibilityIdentifier: Tab.discover.accessibilityIdentifier
                        )
                    }
                    .tag(Tab.discover)

                ReadingListView()
                    .tabItem {
                        TabIcon(
                            imageName: selection.readingListImageName,
                            accessibilityIdentifier: Tab.readingList.accessibilityIdentifier
                        )
                    }
                    .tag(Tab.readingList)

                LoginView()
                .tabItem {
                    Image(systemName: "person")
                }
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(Color(.mosoLayerColor1), for: .tabBar)
        }
        .accentColor(Color(.mosoIconColorAccent))
    }
}

struct TabIcon: View {
    let imageName: ImageCatalog
    let accessibilityIdentifier: String
    var body: some View {
        Label(
            title: { Text("") },
            icon: { Image(imageName).renderingMode(.template) }
        ).accessibilityIdentifier(accessibilityIdentifier)
    }
}

enum Tab {
    case discover
    case readingList

    var accessibilityIdentifier: String {
        switch self {
        case .discover: return "discover-tab-bar-button"
        case .readingList: return "readingList-tab-bar-button"
        }
    }

    var discoverImageName: ImageCatalog {
        return self == .discover ? .discoverFill : .discover
    }

    var readingListImageName: ImageCatalog {
        return self == .readingList ? .saveFill : .save
    }
}

#Preview {
    RootView(configurator: AppConfigurator())
}
