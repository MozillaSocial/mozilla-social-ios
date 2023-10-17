// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import MoSoAnalytics

/// Placeholder `DiscoverTracker` used in previews
struct PreviewTracker: DiscoverTracker {
    func trackDiscoverScreenImpression() {}
    func trackRecommendationOpen(recommendationID: String) {}
    func trackRecommendationShare(recommendationID: String) {}
    func trackRecommendationBookmark(recommendationID: String) {}
    func trackRecommendationImpression(recommendationID: String) {}
}
