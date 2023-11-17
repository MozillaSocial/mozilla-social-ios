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
        let baseTracker = MockBaseTracker(session: MoSoSessionManager(user: user))
        let discoverTracker = MoSoDiscoverTracker(baseTracker: baseTracker)
        baseTracker.engagementExpectation = expectation(description: "open recommendation")
        // When
        discoverTracker.trackRecommendationOpen(recommendationID: "Rec001")
        // Then
        XCTAssertEqual(baseTracker.mastodonAccountHandle, "example@username.org")
        XCTAssertEqual(baseTracker.mastodonAccountID, "myNickname")
        XCTAssertEqual(baseTracker.recommendationID, "Rec001")
        XCTAssertEqual(baseTracker.uiIdentifier, "discover.recommendation.open")
        XCTAssertEqual(baseTracker.engagementAction, .general)
        XCTAssertNil(baseTracker.postID)
        XCTAssertNil(baseTracker.additionalInfo)
        XCTAssertNil(baseTracker.associatedValue)
        waitForExpectations(timeout: 1)
    }

    func testTrackRecommendationShare() {
        // Given
        let user = MoSoUser(username: "example@username.org", identifier: "myNickname")
        let baseTracker = MockBaseTracker(session: MoSoSessionManager(user: user))
        let discoverTracker = MoSoDiscoverTracker(baseTracker: baseTracker)
        baseTracker.engagementExpectation = expectation(description: "share recommendation")
        // When
        discoverTracker.trackRecommendationShare(recommendationID: "Rec001")
        // Then
        XCTAssertEqual(baseTracker.mastodonAccountHandle, "example@username.org")
        XCTAssertEqual(baseTracker.mastodonAccountID, "myNickname")
        XCTAssertEqual(baseTracker.recommendationID, "Rec001")
        XCTAssertEqual(baseTracker.uiIdentifier, "discover.recommendation.share")
        XCTAssertEqual(baseTracker.engagementAction, .share)
        XCTAssertNil(baseTracker.postID)
        XCTAssertNil(baseTracker.additionalInfo)
        XCTAssertNil(baseTracker.associatedValue)
        waitForExpectations(timeout: 1)
    }

    func testTrackRecommendationBookmark() {
        // Given
        let user = MoSoUser(username: "example@username.org", identifier: "myNickname")
        let baseTracker = MockBaseTracker(session: MoSoSessionManager(user: user))
        let discoverTracker = MoSoDiscoverTracker(baseTracker: baseTracker)
        baseTracker.engagementExpectation = expectation(description: "bookmark recommendation")
        // When
        discoverTracker.trackRecommendationBookmark(recommendationID: "Rec001")
        // Then
        XCTAssertEqual(baseTracker.mastodonAccountHandle, "example@username.org")
        XCTAssertEqual(baseTracker.mastodonAccountID, "myNickname")
        XCTAssertEqual(baseTracker.recommendationID, "Rec001")
        XCTAssertEqual(baseTracker.uiIdentifier, "discover.recommendation.bookmark")
        XCTAssertEqual(baseTracker.engagementAction, .bookmark)
        XCTAssertNil(baseTracker.postID)
        XCTAssertNil(baseTracker.additionalInfo)
        XCTAssertNil(baseTracker.associatedValue)
        waitForExpectations(timeout: 1)
    }

    func testTrackDiscoverScreenImpression() {
        // Given
        let user = MoSoUser(username: "example@username.org", identifier: "myNickname")
        let baseTracker = MockBaseTracker(session: MoSoSessionManager(user: user))
        let discoverTracker = MoSoDiscoverTracker(baseTracker: baseTracker)
        baseTracker.impressionExpectation = expectation(description: "discover screen impression")
        // When
        discoverTracker.trackDiscoverScreenImpression()
        // Then
        XCTAssertEqual(baseTracker.mastodonAccountHandle, "example@username.org")
        XCTAssertEqual(baseTracker.mastodonAccountID, "myNickname")
        XCTAssertEqual(baseTracker.uiIdentifier, "discover.screen.impression")
        XCTAssertNil(baseTracker.postID)
        XCTAssertNil(baseTracker.additionalInfo)
        XCTAssertNil(baseTracker.associatedValue)
        XCTAssertNil(baseTracker.recommendationID)
        waitForExpectations(timeout: 1)
    }

    func testTrackRecommendationImpression() {
        // Given
        let user = MoSoUser(username: "example@username.org", identifier: "myNickname")
        let baseTracker = MockBaseTracker(session: MoSoSessionManager(user: user))
        let discoverTracker = MoSoDiscoverTracker(baseTracker: baseTracker)
        baseTracker.impressionExpectation = expectation(description: "recommendation impression")
        // When
        discoverTracker.trackRecommendationImpression(recommendationID: "Rec001")
        // Then
        XCTAssertEqual(baseTracker.mastodonAccountHandle, "example@username.org")
        XCTAssertEqual(baseTracker.mastodonAccountID, "myNickname")
        XCTAssertEqual(baseTracker.recommendationID, "Rec001")
        XCTAssertEqual(baseTracker.uiIdentifier, "discover.recommendation.impression")
        XCTAssertNil(baseTracker.postID)
        XCTAssertNil(baseTracker.additionalInfo)
        XCTAssertNil(baseTracker.associatedValue)
        waitForExpectations(timeout: 1)
    }
}
