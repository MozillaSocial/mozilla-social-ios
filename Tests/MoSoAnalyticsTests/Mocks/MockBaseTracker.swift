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
    var itemURL: String?
    var associatedValue: String?
    var additionalInfo: String?
    var uiIdentifier: String?
    var url: String?

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

<<<<<<< HEAD
    func trackImpression(postID: String?, recommendationID: String?, additionalInfo: String?, uiIdentifier: String?, url: String?) {
=======
    func trackImpression(postID: String?, recommendationID: String?, itemURL: String?, additionalInfo: String?, uiIdentifier: String?) {
>>>>>>> develop
        self.postID = postID
        self.recommendationID = recommendationID
        self.itemURL = itemURL
        self.additionalInfo = additionalInfo
        self.uiIdentifier = uiIdentifier
        self.url = url
        impressionExpectation?.fulfill()
    }

<<<<<<< HEAD
    func trackEngagement(action: MoSoAnalytics.EngagementAction, associatedValue: String?, postID: String?, recommendationID: String?, additionalInfo: String?, uiIdentifier: String?, url: String?) {
=======
    func trackEngagement(action: MoSoAnalytics.EngagementAction, associatedValue: String?, postID: String?, recommendationID: String?, itemURL: String?, additionalInfo: String?, uiIdentifier: String?) {
>>>>>>> develop
        self.engagementAction = action
        self.associatedValue = associatedValue
        self.postID = postID
        self.recommendationID = recommendationID
        self.itemURL = itemURL
        self.additionalInfo = additionalInfo
        self.uiIdentifier = uiIdentifier
        self.url = url
        engagementExpectation?.fulfill()
    }
}
