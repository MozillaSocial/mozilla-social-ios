// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import MoSoCore
import XCTest
@testable import MoSoAnalytics

class MoSoDiscoverTrackerTests: XCTestCase {
    func testTrackRecommendationOpen() {
        // Given
        let user = MoSoUser(username: "example@username.org", identifier: "myNickname")
        let baseTracker = MockBaseTracker(session: MoSoSession(user: user))
        let discoverTracker = MoSoDiscoverTracker(baseTracker: baseTracker)
        baseTracker.engagementExpectation = expectation(description: "Engagement event")
        // When
        discoverTracker.trackRecommendationOpen(recommendationID: "Rec001")
        // Then
        XCTAssertEqual(baseTracker.mastodonAccountHandle, "example@username.org")
        XCTAssertEqual(baseTracker.mastodonAccountID, "myNickname")
        XCTAssertEqual(baseTracker.recommendationID, "Rec001")
        XCTAssertEqual(baseTracker.uiIdentifier, "discover.recommendation.open")
        XCTAssertEqual(baseTracker.engagementAction, .general)
        waitForExpectations(timeout: 1)
    }
}
