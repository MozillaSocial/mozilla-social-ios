// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import DiscoverKit
import DesignKit
import ReadingListKit
import SwiftUI

struct RootView: View {
    @Environment(\.scenePhase)
    var scenePhase
    @State private var selection: Tab = .discover
    let configurator: AppConfigurator

    var body: some View {
        TabView(selection: $selection) {
            Group {
                configurator.makeDiscoverTab()
                    .tabItem {
                        TabIcon(
                            imageName: selection.discoverImageName,
                            accessibilityIdentifier: AccessibilityIdentifiers.Tab.discover,
                            accessibilityLabel: AccessibilityLabels.Tab.discover
                        )
                    }
                    .tag(Tab.discover)

                configurator.makeReadingListTab()
                    .tabItem {
                        TabIcon(
                            imageName: selection.readingListImageName,
                            accessibilityIdentifier: AccessibilityIdentifiers.Tab.readingList,
                            accessibilityLabel: AccessibilityLabels.Tab.readingList
                        )
                    }
                    .tag(Tab.readingList)

                LoginView(sessionManager: configurator.session)
                .tabItem {
                    Image(systemName: "person")
                }
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(Color(.mosoLayerColor1), for: .tabBar)
        }
        .accentColor(Color(.mosoIconColorAccent))
        .onChange(of: scenePhase) { newPhase in
                        if newPhase == .active {
                            configurator.analyticsProvider.baseTracker.trackAppDidBecomeActive()
                        } else if newPhase == .background {
                            configurator.analyticsProvider.baseTracker.trackAppWillBackground()
                        }
                    }
    }
}

struct TabIcon: View {
    let imageName: ImageCatalog
    let accessibilityIdentifier: String
    let accessibilityLabel: String
    var body: some View {
        Label(
            title: { Text("") },
            icon: { Image(imageName).renderingMode(.template) }
        )
        .accessibilityElement(children: .ignore)
        .accessibilityIdentifier(accessibilityIdentifier)
        .accessibilityLabel(accessibilityLabel)
    }
}

enum Tab {
    case discover
    case readingList

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
