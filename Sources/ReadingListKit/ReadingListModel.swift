// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import Combine

protocol ReadingListModelDelegate: AnyObject {
    func readingListDidLoad(urlStrings: [String])
}

public class ReadingListModel: ReadingListModelDelegate, ObservableObject {
    let pocketAccessLayer: PocketAccessLayer
    @Published var readingListItems: [ReadingListCellViewModel] = []

    public init(sessionProvider: @escaping ReadingListSessionProvider, groupID: String, consumerKey: String) {
        pocketAccessLayer = PocketAccessLayer(sessionProvider, consumerKey)
        pocketAccessLayer.delegate = self
        pocketAccessLayer.initApolloClient()

        loadReadingList()
    }

    func loadReadingList() {
        pocketAccessLayer.getSaves()
    }

    func readingListDidLoad(urlStrings: [String]) {
        urlStrings.forEach { urlString in
            Task {
                guard let item = try? await pocketAccessLayer.getItemForURL(urlString) else { return }
                await MainActor.run {
                    readingListItems.append(readingListItem(from: item))
                }
            }
        }
    }

    func readingListItem(from item: PocketGraph.ItemByURLQuery.Data.ItemByUrl) -> ReadingListCellViewModel {
        let defaultImageURLString = "https://helios-i.mashable.com/imagery/articles/05fACELrEVc4kAfNQbhhcVh/hero-image.fill.size_1248x702.v1667556469.png"

        let id = item.remoteID
        let title = item.title ?? item.givenUrl
        let subtitle = item.domainMetadata?.name ?? host(from: item.givenUrl) ?? ""
        let contentURL = item.resolvedUrl ?? item.givenUrl
        let thumbnailURL = image(for: item) ?? defaultImageURLString

        return ReadingListCellViewModel(id: id, title: title, subtitle: subtitle, contentURL: contentURL, thumbnailURL: thumbnailURL)
    }

    func host(from url: String) -> String? {
        guard let url = URL(string: url) else { return nil }
        return url.host
    }

    func image(for item: PocketGraph.ItemByURLQuery.Data.ItemByUrl) -> String? {
        item.syndicatedArticle?.mainImage ?? item.topImageUrl ?? item.domainMetadata?.logo
    }
}
