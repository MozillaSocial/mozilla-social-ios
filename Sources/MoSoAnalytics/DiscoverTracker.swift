// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

/// A protocol for an analytics module to track events in `DiscoverKit`. Consumers can use the
/// implementation offered by `AnalyticsProvider`, or implement their own
public protocol DiscoverTracker {
    func trackRecommendationOpen(recommendationID: String)
    func trackRecommendationShare(recommendationID: String)
    func trackRecommendationBookmark(recommendationID: String)
    func trackRecommendationImpression(recommendationID: String)
}

struct MoSoDiscoverTracker: DiscoverTracker {
    private let baseTracker: BaseTracker

    init(baseTracker: BaseTracker) {
        self.baseTracker = baseTracker
    }

    func trackRecommendationOpen(recommendationID: String) {
        trackRecommendationEngagement(action: .general, recommendationID: recommendationID, uiIdentifier: UIIdentifiers.recommendationOpen)
    }

    func trackRecommendationShare(recommendationID: String) {
        trackRecommendationEngagement(action: .general, recommendationID: recommendationID, uiIdentifier: UIIdentifiers.recommendationShare)
    }

    func trackRecommendationBookmark(recommendationID: String) {
        trackRecommendationEngagement(action: .bookmark, recommendationID: recommendationID, uiIdentifier: UIIdentifiers.recommendationBookmark)
    }

    func trackRecommendationImpression(recommendationID: String) {
        baseTracker.trackImpression(postID: nil, recommendationID: recommendationID, additionalInfo: nil, uiIdentifier: UIIdentifiers.recommendationImpression)
    }

    private func trackRecommendationEngagement(action: EngagementAction, recommendationID: String, uiIdentifier: String) {
        baseTracker.trackEngagement(
            action: action,
            associatedValue: nil,
            postID: nil,
            recommendationID: recommendationID,
            additionalInfo: nil,
            uiIdentifier: uiIdentifier
        )
    }
}

// MARK: UI Identifiers
private extension MoSoDiscoverTracker {
    enum UIIdentifiers {
        // Impressions
        static let recommendationImpression = "discover.recommendation.impression"
        // Engagements
        static let recommendationOpen = "discover.recommendation.open"
        static let recommendationShare = "discover.recommendation.share"
        static let recommendationBookmark = "discover.recommendation.bookmark"
    }
}
