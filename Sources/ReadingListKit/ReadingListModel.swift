// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import Combine
import MoSoAnalytics
import MoSoCore
import DesignKit

protocol ReadingListModelDelegate: AnyObject {
    func didFetchReadingListItems(urlStrings: [String], totalItemCount: Int, cursor: String?)
    func removeItemFromList(item: String)
    func operationFailed(with error: PocketAccessLayerError)
}

enum ReadingListDisplayMode {
    case normal
    case empty
    case error
    case loggedOut
}

public class ReadingListModel: ReadingListModelDelegate, ObservableObject {
    private let analytics: ReadingListTracker
    private let paginationPageSize: Int = 30
    private let loadMoreThresholdCutoff: Int = 29

    var pocketAccessLayer: PocketAccessLayerProtocol
    var totalNumberOfItemsInReadingList: Int?
    @Published private(set) var displayMode: ReadingListDisplayMode = .normal
    @Published private(set) var readingListItems: [ReadingListCellViewModel] = []
    @Published var toast: ToastConfiguration?
    private var paginationCursor: String?

    public init(sessionProvider: @escaping ReadingListSessionProvider, consumerKey: String, analyticsTracker: ReadingListTracker) {
        self.analytics = analyticsTracker
        pocketAccessLayer = PocketAccessLayer(sessionProvider, consumerKey, paginationPageSize)
        pocketAccessLayer.delegate = self

        fetchMoreReadingList()

        NotificationCenter.default.addObserver(self, selector: #selector(userAuthDidChange(_:)), name: .userAuthDidChange, object: nil)
    }

    // MARK: - Fetch Reading List Items

    func didDisplayItem(with id: String) {
        if allItemsAreDownloaded() {
            return
        }

        guard let item = item(with: id) else {
            // Item not found, highlight an error?
            return
        }

        let loadMoreThreshold = readingListItems.count - loadMoreThresholdCutoff
        if readingListItems.firstIndex(of: item) == loadMoreThreshold {
            fetchMoreReadingList()
        }
    }

    private func item(with id: String) -> ReadingListCellViewModel? {
        readingListItems.first(where: { $0.id == id })
    }

    func fetchMoreReadingList() {
        pocketAccessLayer.fetchSaves(after: paginationCursor)
    }

    func allItemsAreDownloaded() -> Bool {
        totalNumberOfItemsInReadingList == readingListItems.count
    }

    // MARK: - Delegate Methods

    func didFetchReadingListItems(urlStrings: [String], totalItemCount: Int, cursor: String?) {
        totalNumberOfItemsInReadingList = totalItemCount
        paginationCursor = cursor

        displayMode = .normal

        if totalItemCount == 0 {
            displayMode = .empty
        }

        Task {
            await fetchAndAppend(itemUrls: urlStrings)
        }
    }

    @MainActor
    func fetchAndAppend(itemUrls: [String]) async {
        var newItems: [ReadingListCellViewModel] = []

        for url in itemUrls {
            guard let item = try? await pocketAccessLayer.getItemForURL(url) else { continue }
            newItems.append(readingListItem(from: item))
        }

        readingListItems.append(contentsOf: newItems)
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
        }
    }

    func operationFailed(with error: PocketAccessLayerError) {
        if case PocketAccessLayerError.invalidAuthentication = error {
            displayMode = .loggedOut
        } else if case PocketAccessLayerError.failedToArchiveItem = error {
            toast = ToastConfiguration(style: .error, message: "Unable to Archive item")
        } else {
            displayMode = .error
        }
    }

    // MARK: - Archive Items

    func archive(item: String) {
        pocketAccessLayer.archive(item: item)
    }

    // MARK: - ReadingListItem Helpers

    func readingListItem(from item: PocketItem) -> ReadingListCellViewModel {
        let id = item.remoteID
        let title = item.title ?? item.givenUrl
        let subtitle = item.subtitle
        let contentURL = item.resolvedUrl ?? item.givenUrl
        let thumbnailURL = item.image

        return ReadingListCellViewModel(id: id, title: title, subtitle: subtitle ?? "", contentURL: contentURL, thumbnailURL: thumbnailURL)
    }

    // MARK: - Notification Events

    @objc
    func userAuthDidChange(_ notification: Notification) {
        readingListItems.removeAll()
        paginationCursor = nil

        if notification.userInfo?["hasToken"] as? Bool == true {
            displayMode = .normal
            fetchMoreReadingList()
        } else {
            displayMode = .loggedOut
        }
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
}
