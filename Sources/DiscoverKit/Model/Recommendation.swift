// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import MoSoClient

// In practice, we might deal with more complex mapping and persistence, so let's keep it this way for clarity
/// Local Recommendation type
struct Recommendation: Identifiable, Equatable, Hashable {
    public var id = UUID()
    public let recommendationID: String
    public let url: String
    public let title: String
    public let excerpt: String
    public let publisher: String
    public let imageUrl: String?

    init(recommendationID: String, url: String, title: String, excerpt: String, publisher: String, imageUrl: String?) {
        self.recommendationID = recommendationID
        self.url = url
        self.title = title
        self.excerpt = excerpt
        self.publisher = publisher
        self.imageUrl = imageUrl
    }

    init(from remoteRecommendation: RemoteRecommendation) {
        self.recommendationID = remoteRecommendation.recommendationID
        self.url = remoteRecommendation.url
        self.title = remoteRecommendation.title
        self.excerpt = remoteRecommendation.excerpt
        self.publisher = remoteRecommendation.publisher
        self.imageUrl = remoteRecommendation.imageUrl
    }
}
