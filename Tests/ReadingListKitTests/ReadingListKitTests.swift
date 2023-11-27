// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import XCTest
@testable import ReadingListKit
@testable import MoSoAnalytics
@testable import MoSoCore

final class ReadingListKitTests: XCTestCase {
    func testExample() {
        let mockSessionProvider: ReadingListSessionProvider = { return MoSoSession(token: "Token", guid: "GUID") as! ReadingListSession }
        var model = ReadingListModel(sessionProvider: mockSessionProvider, groupID: "GroupID", consumerKey: "ConsumerKey", analyticsTracker: MoSoReadingListTracker(baseTracker: MockBaseTracker()))

        let mockAccessLayer = MocketAccessLayer()
        mockAccessLayer.fetchSavesAction = {
            XCTAssert(true) // Check that the code was indeed called as expected.
        }
        model.pocketAccessLayer = mockAccessLayer

        model.fetchMoreReadingList()
    }
}

class MocketAccessLayer: PocketAccessLayer {
    var delegate: ReadingListKit.ReadingListModelDelegate?

    var fetchSavesAction: () -> Void = { XCTAssert(false) } // Fail by default
    var initApolloAction: () -> Void = { XCTAssert(false) }
    var getItemForURLAction: () -> Void = { XCTAssert(false) }
    var archiveAction: () -> Void = { XCTAssert(false) }

    func fetchSaves() {
        fetchSavesAction()
    }

    func initApolloClient() {
        initApolloAction()
    }

    func getItemForURL(_ urlString: String) async throws -> ReadingListKit.PocketGraph.ItemByURLQuery.Data.ItemByUrl {
        fatalError()
    }

    func archive(item: String) {
        archiveAction()
    }
}

class MockBaseTracker: BaseTracker {
    func start() {
    }

    func stop() {
    }

    func trackImpression(postID: String?, recommendationID: String?, itemURL: String?, additionalInfo: String?, uiIdentifier: String?) {
    }

    func trackEngagement(action: MoSoAnalytics.EngagementAction, associatedValue: String?, postID: String?, recommendationID: String?, itemURL: String?, additionalInfo: String?, uiIdentifier: String?) {
    }
}
