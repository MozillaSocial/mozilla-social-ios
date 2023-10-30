// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import MoSoAnalytics

@testable import DiscoverKit

/// Mock of `DiscoverTracker` used in tests
class MockTracker: DiscoverTracker {
    var calls: [String] = []

    func trackDiscoverScreenImpression() {
        calls.append(#function)
    }

    func trackRecommendationOpen(recommendationID: String) {
        calls.append(#function)
    }

    func trackRecommendationShare(recommendationID: String) {
        calls.append(#function)
    }

    func trackRecommendationBookmark(recommendationID: String) {
        calls.append(#function)
    }

    func trackRecommendationImpression(recommendationID: String) {
        calls.append(#function)
    }
}
