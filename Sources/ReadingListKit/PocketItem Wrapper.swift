// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation

protocol PocketItem {
    var remoteID: String { get }
    var title: String? { get }
    var givenUrl: String { get }
    var resolvedUrl: String? { get }
    var image: String? { get }
    var subtitle: String? { get }
}

extension PocketGraph.ItemByURLQuery.Data.ItemByUrl: PocketItem {
    var image: String? {
        self.syndicatedArticle?.mainImage ?? self.topImageUrl ?? self.domainMetadata?.logo
    }

    var subtitle: String? {
        let host = self.domainMetadata?.name ?? host()

        guard let host = host else {
            return ""
        }

        guard let timeToRead = self.timeToRead else { return host }

        return host + " • " + String(describing: timeToRead) + " min"
    }

    func host() -> String? {
        guard let url = URL(string: self.givenUrl) else { return nil }
        return url.host
    }
}
