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
        trackEngagement(action: .general, itemURL: itemURL, uiIdentifier: UIIdentifiers.itemOpen)
    }

    func trackItemShare(itemURL: String) {
        trackEngagement(action: .share, itemURL: itemURL, uiIdentifier: UIIdentifiers.itemShare)
    }

    func trackItemArchive(itemURL: String) {
        trackEngagement(action: .archive, itemURL: itemURL, uiIdentifier: UIIdentifiers.itemArchive)
    }

    func trackItemImpression(itemURL: String) {
        baseTracker.trackImpression(postID: nil, recommendationID: nil, additionalInfo: nil, uiIdentifier: UIIdentifiers.itemImpression, url: itemURL)
    }

    func trackReadingListScreenImpression() {
        baseTracker.trackImpression(postID: nil, recommendationID: nil, additionalInfo: nil, uiIdentifier: UIIdentifiers.screenImpression, url: nil)
    }

    private func trackEngagement(action: EngagementAction, itemURL: String, uiIdentifier: String) {
        baseTracker.trackEngagement(
            action: action,
            associatedValue: nil,
            postID: nil,
            recommendationID: nil,
            additionalInfo: nil,
            uiIdentifier: uiIdentifier,
            url: itemURL
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
