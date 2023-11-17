// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI
import MoSoClient
import MoSoCore
import MoSoAnalytics

/// Dependency container
public final class DiscoverProvider: ObservableObject {
    // TODO: this property can be observed as the session/user logged in status changes
    @Published var session: MoSoSessionManager
    private let tracker: DiscoverTracker

    public init(session: MoSoSessionManager, tracker: DiscoverTracker) {
        self.session = session
        self.tracker = tracker
    }

    @MainActor
    public func makeDiscoverRootView() -> some View {
        RootView(viewModel: self.makeDiscoverViewModel())
    }

    @MainActor
    private func makeDiscoverViewModel() -> DiscoverViewModel {
        DiscoverViewModel(store: makeRecommendationsStore(), tracker: tracker)
    }

    private func makeRecommendationsStore() -> RecommendationsStore {
        InMemoryRecommendationsStore(client: makeRemoteClient())
    }

    private func makeRemoteClient() -> RemoteClient {
        RestRemoteClient()
    }
}
