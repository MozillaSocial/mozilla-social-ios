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
    @Published var readingListURLs: [ReadingListCellViewModel] = []

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
        let itemsToAdd: [ReadingListCellViewModel] = urlStrings.map {
            ReadingListCellViewModel(title: $0, subtitle: "Testing!", thumbnailURL: nil, contentURL: $0)
        }

        readingListURLs.append(contentsOf: itemsToAdd)
        print(urlStrings)
    }
}
