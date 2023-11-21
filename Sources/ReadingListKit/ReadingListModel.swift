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
                    readingListItems.append(ReadingListCellViewModel(item, imageURLString: image(for: item)))
                }
            }
        }
    }

    func image(for item: PocketGraph.ItemByURLQuery.Data.ItemByUrl) -> String? {
        item.syndicatedArticle?.mainImage ?? item.topImageUrl ?? item.domainMetadata?.logo
    }
}
