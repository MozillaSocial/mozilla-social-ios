// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// TODO: complete method signatures with actual parameters
/// A protocol for an analytics module to track events in `DiscoverKit`. Consumers can use the
/// default implementation offered by `AnalyticsProvider`, or implement their own
public protocol DiscoverTracker {
    func trackRecommendationOpen()
    func trackRecommendationShare()
}

struct MoSoDiscoverTracker: DiscoverTracker {
    private let baseTracker: BaseTracker

    init(baseTracker: BaseTracker) {
        self.baseTracker = baseTracker
    }

    func trackRecommendationOpen() {
        baseTracker.trackEngagement(mastodonID: "", recommendationID: "")
    }

    func trackRecommendationShare() {
        baseTracker.trackEngagement(mastodonID: "", recommendationID: "")
    }
}
