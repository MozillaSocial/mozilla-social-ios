// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Glean
import MoSoCore
import XCTest
@testable import MoSoAnalytics

final class GleanBaseTrackerTests: XCTestCase {
    override func setUp() {
        Glean.shared.resetGlean(clearStores: true)
    }

    func testImpression() {
        // Given
        let user = MoSoUser(username: "example@username.org", identifier: "myNickname")
        let tracker = GleanBaseTracker(session: MoSoSessionManager(user: user))
        // When
        tracker.trackImpression(
            postID: "Post001",
            recommendationID: "Rec001",
            additionalInfo: "Some additional info",
            uiIdentifier: "example.event.impression",
            url: "www.url1.com"
        )
        // Then
        let events = GleanMetrics.Ui.impression.testGetValue()!
        let event = events[0]

        XCTAssertEqual(1, events.count)
        XCTAssertEqual(event.category, "ui")
        XCTAssertEqual(event.name, "impression")
        XCTAssertEqual(event.extra!["mastodon_account_handle"], "example@username.org")
        XCTAssertEqual(event.extra!["mastodon_account_id"], "myNickname")
        XCTAssertEqual(event.extra!["mastodon_status_id"], "Post001")
        XCTAssertEqual(event.extra!["recommendation_id"], "Rec001")
        XCTAssertEqual(event.extra!["ui_identifier"], "example.event.impression")
        XCTAssertEqual(event.extra!["ui_additional_detail"], "Some additional info")
    }

    func testTrackMultipleImpressions() {
        // Given
        let user = MoSoUser(username: "example@username.org", identifier: "myNickname")
        let tracker = GleanBaseTracker(session: MoSoSessionManager(user: user))
        // When
        tracker.trackImpression(
            postID: "Post001",
            recommendationID: "Rec001",
            additionalInfo: "Some additional info",
            uiIdentifier: "example.event.impression",
            url: "www.url1.com"
        )

        tracker.trackImpression(
            postID: "Post002",
            recommendationID: "Rec002",
            additionalInfo: "Some additional info",
            uiIdentifier: "example.event.impression",
            url: "www.url2.com"
        )

        tracker.trackImpression(
            postID: "Post003",
            recommendationID: "Rec003",
            additionalInfo: "Some additional info",
            uiIdentifier: "example.event.impression",
            url: "www.url3.com"
        )

        // Then
        let events = GleanMetrics.Ui.impression.testGetValue()!
        XCTAssertEqual(3, events.count)
        XCTAssertEqual(events[0].extra!["mastodon_status_id"], "Post001")
        XCTAssertEqual(events[1].extra!["mastodon_status_id"], "Post002")
        XCTAssertEqual(events[2].extra!["mastodon_status_id"], "Post003")
    }

    func testEngagement() {
        // Given
        let user = MoSoUser(username: "example@username.org", identifier: "myNickname")
        let tracker = GleanBaseTracker(session: MoSoSessionManager(user: user))
        let action: EngagementAction = .general
        // When
        tracker.trackEngagement(
            action: action,
            associatedValue: "someValue",
            postID: "Post001",
            recommendationID: "Rec001",
            additionalInfo: "Some additional info",
            uiIdentifier: "example.event.impression",
            url: "www.url1.com"
        )
        // Then
        let events = GleanMetrics.Ui.engagement.testGetValue()!
        let event = events[0]

        XCTAssertEqual(1, events.count)
        XCTAssertEqual(event.category, "ui")
        XCTAssertEqual(event.name, "engagement")

        XCTAssertEqual(event.extra!["engagement_type"], action.rawValue)
        XCTAssertEqual(event.extra!["mastodon_account_handle"], "example@username.org")
        XCTAssertEqual(event.extra!["mastodon_account_id"], "myNickname")
        XCTAssertEqual(event.extra!["mastodon_status_id"], "Post001")
        XCTAssertEqual(event.extra!["recommendation_id"], "Rec001")
        XCTAssertEqual(event.extra!["ui_identifier"], "example.event.impression")
        XCTAssertEqual(event.extra!["ui_additional_detail"], "Some additional info")
    }

    func testTrackMultipleEngagements() {
        // Given
        let user = MoSoUser(username: "example@username.org", identifier: "myNickname")
        let tracker = GleanBaseTracker(session: MoSoSessionManager(user: user))
        // When
        tracker.trackEngagement(
            action: .general,
            associatedValue: "someValue",
            postID: "Post001",
            recommendationID: "Rec001",
            additionalInfo: "Some additional info",
            uiIdentifier: "example.event.impression",
            url: "www.url1.com"
        )

        tracker.trackEngagement(
            action: .bookmark,
            associatedValue: "someValue",
            postID: "Post002",
            recommendationID: "Rec002",
            additionalInfo: "Some additional info",
            uiIdentifier: "example.event.impression",
            url: "www.url2.com"
        )

        tracker.trackEngagement(
            action: .share,
            associatedValue: "someValue",
            postID: "Post003",
            recommendationID: "Rec003",
            additionalInfo: "Some additional info",
            uiIdentifier: "example.event.impression",
            url: "www.url3.com"
        )
        // Then
        let events = GleanMetrics.Ui.engagement.testGetValue()!
        XCTAssertEqual(3, events.count)
        XCTAssertEqual(events[0].extra!["mastodon_status_id"], "Post001")
        XCTAssertEqual(events[1].extra!["mastodon_status_id"], "Post002")
        XCTAssertEqual(events[2].extra!["mastodon_status_id"], "Post003")
    }
}
