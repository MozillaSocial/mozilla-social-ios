// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import Combine

protocol ReadingListModelDelegate: AnyObject {
    func readingListDidLoad(urlStrings: [String], totalItemCount: Int)
}

public class ReadingListModel: ReadingListModelDelegate, ObservableObject {
    let pocketAccessLayer: PocketAccessLayer
    var totalNumberOfItemsInReadingList: Int?
    @Published var readingListItems: [ReadingListCellViewModel] = []

    public init(sessionProvider: @escaping ReadingListSessionProvider, groupID: String, consumerKey: String) {
        pocketAccessLayer = PocketAccessLayer(sessionProvider, consumerKey)
        pocketAccessLayer.delegate = self
        pocketAccessLayer.initApolloClient()

        loadReadingList()
    }

    func didDisplay(item: ReadingListCellViewModel) {
        print("Displaying: \(item.contentURL)")

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

    private func allItemsAreDownloaded() -> Bool {
        totalNumberOfItemsInReadingList == readingListItems.count
    }

    func loadReadingList() {
        pocketAccessLayer.fetchSaves()
    }

    func readingListDidLoad(urlStrings: [String], totalItemCount: Int) {
        totalNumberOfItemsInReadingList = totalItemCount

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
