// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import BrazeKit
import Foundation
import BrazeUI

/**
 Class that is managing our Braze SDK implementation
 */
public class MoSoBraze: NSObject, BrazeInAppMessageUIDelegate {
    /// Our Braze SDK Object
    var braze: Braze

    init(apiKey: String, endpoint: String, groupId: String) {
        let configuration = Braze.Configuration(
            apiKey: apiKey,
            endpoint: endpoint
        )

        // Enable logging of general SDK information (e.g. user changes, etc.)
        configuration.logger.level = .info
        configuration.push.appGroup = groupId

        braze = Braze(configuration: configuration)

        super.init()

        setupInAppMessaging()
    }

    private func setupInAppMessaging() {
        let inAppMessageUI = BrazeInAppMessageUI()
        inAppMessageUI.delegate = self
        braze.inAppMessagePresenter = inAppMessageUI
    }

    func changeUser(userId: String, email: String) {
        braze.changeUser(userId: userId)
        let brazeUser = braze.user
        brazeUser.set(email: email)
    }
}
