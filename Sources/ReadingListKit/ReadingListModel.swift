// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation

protocol ReadingListModelDelegate: AnyObject {
    func readingListDidLoad(urlStrings: [String])
}

public class ReadingListModel: ReadingListModelDelegate {
    let pocketAccessLayer: PocketAccessLayer

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
        print(urlStrings)
    }
}
