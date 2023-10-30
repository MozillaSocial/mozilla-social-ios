// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import UIKit

struct Keys {
    static let shared = Keys()

    let pocketAPIConsumerKey: String
    let brazeAPIEndpoint: String
    let brazeAPIKey: String
    let groupID: String

    private init() {
        guard let info = Bundle.main.infoDictionary else {
            fatalError("Unable to load info dictionary for main bundle")
        }

        guard let pocketAPIConsumerKey = info["PocketAPIConsumerKey"] as? String else {
            fatalError("Unable to extract PocketAPIConsumerKey from main bundle")
        }

        guard let brazeAPIEndpoint = info["BrazeAPIEndpoint"] as? String else {
            fatalError("Unable to extract BrazeAPIEndpoint from main bundle")
        }

        guard let brazeAPIKey = info["BrazeAPIKey"] as? String else {
            fatalError("Unable to extract BrazeAPIKey from main bundle")
        }

        guard let groupID = info["GroupID"] as? String else {
            fatalError("Unable to extract GroupID from main bundle")
        }

        self.pocketAPIConsumerKey = pocketAPIConsumerKey
        self.brazeAPIKey = brazeAPIKey
        self.brazeAPIEndpoint = brazeAPIEndpoint
        self.groupID = groupID
    }
}
