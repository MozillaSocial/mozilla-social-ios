// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import Combine
import MoSoAnalytics

protocol ReadingListModelDelegate: AnyObject {
    func didFetchReadingListItems(urlStrings: [String], totalItemCount: Int)
    func removeItemFromList(item: String)
    func operationFailed(with error: PALError)
}

enum ReadingListDisplayMode {
    case normal
    case empty
    case error
    case loggedOut
}

public class ReadingListModel: ReadingListModelDelegate, ObservableObject {
    private let analytics: ReadingListTracker

    var pocketAccessLayer: PocketAccessLayer
    var totalNumberOfItemsInReadingList: Int?
    @Published private(set) var displayMode: ReadingListDisplayMode = .normal
    @Published private(set) var readingListItems: [ReadingListCellViewModel] = []

    public init(sessionProvider: @escaping ReadingListSessionProvider, consumerKey: String, analyticsTracker: ReadingListTracker) {
        self.analytics = analyticsTracker
        pocketAccessLayer = PocketAccessLayerImplementation(sessionProvider, consumerKey)
        pocketAccessLayer.delegate = self
        pocketAccessLayer.initApolloClient()
    }

    // MARK: - Analytics Events

    func trackReadingListViewImpression() {
        analytics.trackReadingListScreenImpression()
    }

    func trackReadingListItemShare(itemURL: String) {
        analytics.trackItemShare(itemURL: itemURL)
    }

    func trackReadingListItemImpression(itemURL: String) {
        analytics.trackItemImpression(itemURL: itemURL)
    }

    func trackReadingListItemArchive(itemURL: String) {
        analytics.trackItemArchive(itemURL: itemURL)
    }

    func trackReadingListItemOpen(itemURL: String) {
        analytics.trackItemOpen(itemURL: itemURL)
    }

    // MARK: - Fetch Reading List Items

    func didDisplay(item: ReadingListCellViewModel) {
        if allItemsAreDownloaded() {
            return
        }

        let loadMoreThreshold = readingListItems.count - 3
        if readingListItems.firstIndex(of: item) == loadMoreThreshold {
            fetchMoreReadingList()
        }
    }

    func fetchMoreReadingList() {
        pocketAccessLayer.fetchSaves()
    }

    func allItemsAreDownloaded() -> Bool {
        totalNumberOfItemsInReadingList == readingListItems.count
    }

    func loadReadingList() {
        pocketAccessLayer.fetchSaves()
    }

    // MARK: - Delegate Methods

    func didFetchReadingListItems(urlStrings: [String], totalItemCount: Int) {
        totalNumberOfItemsInReadingList = totalItemCount

        displayMode = .normal
        print("Set displayMode to: \(displayMode)")

        if totalItemCount == 0 {
            displayMode = .empty
            print("Set displayMode to: \(displayMode)")
        }

        urlStrings.forEach { urlString in
            Task {
                guard let item = try? await pocketAccessLayer.getItemForURL(urlString) else { return }
                let readingListItem = readingListItem(from: item)
                await MainActor.run {
                    readingListItems.append(readingListItem)
                }
            }
        }
    }

    func removeItemFromList(item: String) {
        let filteredItems = self.readingListItems.filter {
            $0.contentURL != item
        }

        readingListItems = filteredItems

        if let oldTotal = totalNumberOfItemsInReadingList {
            totalNumberOfItemsInReadingList = oldTotal - 1
        }

        if totalNumberOfItemsInReadingList == 0 {
            displayMode = .empty
            print("Set displayMode to: \(displayMode)")
        }
    }

    func operationFailed(with error: PALError) {
        if case PALError.invalidAuthentication = error {
            displayMode = .loggedOut
        } else {
            displayMode = .error
        }
        print("Set displayMode to: \(displayMode)")
    }

    // MARK: - Archive Items

    func archive(item: String) {
        pocketAccessLayer.archive(item: item)
    }

    // MARK: - ReadingListItem Helpers

    func readingListItem(from item: PocketGraph.ItemByURLQuery.Data.ItemByUrl) -> ReadingListCellViewModel {
        let defaultImageURLString = "https://helios-i.mashable.com/imagery/articles/05fACELrEVc4kAfNQbhhcVh/hero-image.fill.size_1248x702.v1667556469.png"

        let id = item.remoteID
        let title = item.title ?? item.givenUrl
        let subtitle = subtitle(for: item)
        let contentURL = item.resolvedUrl ?? item.givenUrl
        let thumbnailURL = image(for: item) ?? defaultImageURLString

        return ReadingListCellViewModel(id: id, title: title, subtitle: subtitle, contentURL: contentURL, thumbnailURL: thumbnailURL)
    }

    func image(for item: PocketGraph.ItemByURLQuery.Data.ItemByUrl) -> String? {
        item.syndicatedArticle?.mainImage ?? item.topImageUrl ?? item.domainMetadata?.logo
    }

    func subtitle(for item: PocketGraph.ItemByURLQuery.Data.ItemByUrl) -> String {
        let host = item.domainMetadata?.name ?? host(from: item.givenUrl)

        guard let host = host else {
            return ""
        }

        guard let timeToRead = item.timeToRead else { return host }

        return host + " • " + String(describing: timeToRead) + " min"
    }

    func host(from url: String) -> String? {
        guard let url = URL(string: url) else { return nil }
        return url.host
    }
}
