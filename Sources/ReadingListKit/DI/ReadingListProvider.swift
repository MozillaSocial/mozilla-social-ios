// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI
import MoSoClient
import MoSoCore
import MoSoAnalytics

/// Dependency container
public final class ReadingListProvider: ObservableObject {
    private let tracker: ReadingListTracker
    private let consumerKey: String
    private let sessionProvider: ReadingListSessionProvider

    public init(sessionProvider: @escaping ReadingListSessionProvider, consumerKey: String, tracker: ReadingListTracker) {
        self.sessionProvider = sessionProvider
        self.consumerKey = consumerKey
        self.tracker = tracker
    }

    @MainActor
    public func makeReadingListView() -> some View {
        ReadingListView(model: self.makeReadingListModel())
    }

    @MainActor
    private func makeReadingListModel() -> ReadingListModel {
        ReadingListModel(sessionProvider: sessionProvider, consumerKey: consumerKey, analyticsTracker: tracker)
    }
}
