// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// TODO: complete method signatures with actual parameters
/// A protocol for an analytics module to track events in `DiscoverKit`. Consumers can use the
/// default implementation offered by `AnalyticsProvider`, or implement their own
public protocol DiscoverTracker {
    func trackRecommendationOpen(recommendationID: String)
    func trackRecommendationShare(recommendationID: String)
}

struct MoSoDiscoverTracker: DiscoverTracker {
    private let baseTracker: BaseTracker

    init(baseTracker: BaseTracker) {
        self.baseTracker = baseTracker
    }

    func trackRecommendationOpen(recommendationID: String) {
        baseTracker.trackEngagement(
            action: .general,
            associatedValue: nil,
            postID: nil,
            recommendationID: recommendationID,
            additionalInfo: nil,
            uiIdentifier: Identifiers.recommendationOpen
        )
    }

    func trackRecommendationShare(recommendationID: String) {
        baseTracker.trackEngagement(
            action: .general,
            associatedValue: nil,
            postID: nil,
            recommendationID: recommendationID,
            additionalInfo: nil,
            uiIdentifier: Identifiers.recommendationShare
        )
    }
}

private extension MoSoDiscoverTracker {
    enum Identifiers {
        static let recommendationOpen = "discover.recommendation.open"
        static let recommendationShare = "discover.recommendation.share"
    }
}
