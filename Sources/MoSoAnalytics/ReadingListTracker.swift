// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

public protocol ReadingListTracker {
    func trackItemOpen(itemURL: String)
    func trackItemShare(itemURL: String)
    func trackItemArchive(itemURL: String)
    func trackItemImpression(itemURL: String)
    func trackReadingListScreenImpression()
}

struct MoSoReadingListTracker: ReadingListTracker {
    private let baseTracker: BaseTracker

    init(baseTracker: BaseTracker) {
        self.baseTracker = baseTracker
    }

    func trackItemOpen(itemURL: String) {
        trackRecommendationEngagement(action: .general, itemURL: itemURL, uiIdentifier: UIIdentifiers.itemOpen)
    }

    func trackItemShare(itemURL: String) {
        trackRecommendationEngagement(action: .share, itemURL: itemURL, uiIdentifier: UIIdentifiers.itemShare)
    }

    func trackItemArchive(itemURL: String) {
        trackRecommendationEngagement(action: .bookmark, itemURL: itemURL, uiIdentifier: UIIdentifiers.itemArchive)
    }

    func trackItemImpression(itemURL: String) {
        baseTracker.trackImpression(postID: nil, recommendationID: nil, itemURL: itemURL, additionalInfo: nil, uiIdentifier: UIIdentifiers.itemImpression)
    }


    func trackReadingListScreenImpression(){
        baseTracker.trackImpression(postID: nil, recommendationID: nil, itemURL: nil, additionalInfo: nil, uiIdentifier: UIIdentifiers.screenImpression)
    }

    private func trackRecommendationEngagement(action: EngagementAction, itemURL: String, uiIdentifier: String) {
        baseTracker.trackEngagement(
            action: action,
            associatedValue: nil,
            postID: nil,
            recommendationID: nil,
            itemURL: itemURL,
            additionalInfo: nil,
            uiIdentifier: uiIdentifier
        )
    }

    enum UIIdentifiers {
        // Impressions
        static let screenImpression = "readingList.screen.impression"
        static let itemImpression = "readingList.item.impression"
        // Engagements
        static let itemOpen = "readingList.item.open"
        static let itemShare = "readingList.item.share"
        static let itemArchive = "readingList.item.archive"
    }
}
