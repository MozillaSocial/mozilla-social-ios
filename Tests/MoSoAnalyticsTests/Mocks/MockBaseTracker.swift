// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import MoSoCore
import MoSoAnalytics
import XCTest

class MockBaseTracker: BaseTracker {
    var startExpectation: XCTestExpectation?
    var stopExpectation: XCTestExpectation?
    var impressionExpectation: XCTestExpectation?
    var engagementExpectation: XCTestExpectation?

    let mastodonAccountHandle: String
    let mastodonAccountID: String

    var engagementAction: EngagementAction = .none
    var postID: String?
    var recommendationID: String?
    var associatedValue: String?
    var additionalInfo: String?
    var uiIdentifier: String?

    init(session: MoSoSessionManager) {
        self.mastodonAccountID = session.user!.identifier
        self.mastodonAccountHandle = session.user!.username
    }

    func start() {
        startExpectation?.fulfill()
    }

    func stop() {
        stopExpectation?.fulfill()
    }

    func trackImpression(postID: String?, recommendationID: String?, additionalInfo: String?, uiIdentifier: String?) {
        self.postID = postID
        self.recommendationID = recommendationID
        self.additionalInfo = additionalInfo
        self.uiIdentifier = uiIdentifier
        impressionExpectation?.fulfill()
    }

    func trackEngagement(action: MoSoAnalytics.EngagementAction, associatedValue: String?, postID: String?, recommendationID: String?, additionalInfo: String?, uiIdentifier: String?) {
        self.engagementAction = action
        self.associatedValue = associatedValue
        self.postID = postID
        self.recommendationID = recommendationID
        self.additionalInfo = additionalInfo
        self.uiIdentifier = uiIdentifier
        engagementExpectation?.fulfill()
    }
}
