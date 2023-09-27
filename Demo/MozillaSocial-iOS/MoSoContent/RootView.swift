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
                            imageName: selection.discoverImage,
                            accessibilityIdentifier: Tab.discover.accessibilityIdentifier
                        )
                    }
                    .tag(Tab.discover)

                ReadingListView()
                    .tabItem {
                        TabIcon(
                            imageName: selection.readingListImage,
                            accessibilityIdentifier: Tab.readingList.accessibilityIdentifier
                        )
                    }
                    .tag(Tab.readingList)

            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(MoSoColors.layer1, for: .tabBar)

        }
        .accentColor(MoSoColors.iconAccent)
    }
}

struct TabIcon: View {
    let imageName: Image
    let accessibilityIdentifier: String
    var body: some View {
        Label(
            title: { Text("") },
            icon: { imageName.renderingMode(.template) }
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

    var discoverImage: Image {
        return self == .discover ? MoSoIcons.discoverFill : MoSoIcons.discover
    }

    var readingListImage: Image {
        return self == .readingList ? MoSoIcons.saveFill : MoSoIcons.save
    }
}

#Preview {
    RootView(configurator: AppConfigurator())
}
