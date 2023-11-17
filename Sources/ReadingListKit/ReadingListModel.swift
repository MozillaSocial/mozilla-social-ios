// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import MoSoCore

public class ReadingListModel {
    let pocketAccessLayer: PocketAccessLayer

    public init(sessionProvider: @escaping () -> MoSoSession, groupID: String, consumerKey: String) {
        pocketAccessLayer = PocketAccessLayer(sessionProvider, consumerKey)
        pocketAccessLayer.initApolloClient()
        pocketAccessLayer.getSaves()
    }
}
