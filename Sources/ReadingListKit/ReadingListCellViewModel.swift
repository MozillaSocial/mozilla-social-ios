// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation

struct ReadingListCellViewModel: Observable, Identifiable {
    let defaultImageURLString = "https://helios-i.mashable.com/imagery/articles/05fACELrEVc4kAfNQbhhcVh/hero-image.fill.size_1248x702.v1667556469.png"

    var id: String
    let title: String
    let subtitle: String
    let contentURL: String
    let thumbnailURL: String

    init(id: String, title: String, subtitle: String, contentURL: String, thumbnailURL: String?) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.contentURL = contentURL
        self.thumbnailURL = thumbnailURL ?? defaultImageURLString
    }

    init(_ item: PocketGraph.ItemByURLQuery.Data.ItemByUrl, imageURLString: String?) {
        self.id = item.remoteID
        self.title = item.title ?? item.givenUrl
        self.subtitle = item.domain ?? item.givenUrl
        self.contentURL = item.resolvedUrl ?? item.givenUrl
        self.thumbnailURL = imageURLString ?? defaultImageURLString
    }
}
