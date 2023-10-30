// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Quick
import Nimble

@testable import DiscoverKit

final class DiscoverViewModelTests: AsyncSpec {
    override class func spec() {
        describe("the Discover tab") {
            var store: MockStore!
            var tracker: MockTracker!
            var viewModel: DiscoverViewModel!

            beforeEach {
                store = MockStore()
                tracker = MockTracker()
                viewModel = await DiscoverViewModel(store: store, tracker: tracker)
                store.isThrowingError = false
            }

            describe("shows state") {
                it("is loading during initial load") {
                    await viewModel.load()
                    let state = await viewModel.state

                    await expect {
                        guard case .loading = state else {
                            return .failed(reason: "wrong enum case \(state)")
                        }
                        return .succeeded
                    }.to(succeed())
                }

                it("is ready with recommendation list") {
                    await viewModel.load()

                    await expect {
                        let state = await viewModel.state
                        guard case .ready(let recommendations) = state else {
                            return .failed(reason: "wrong enum case \(state) not ")
                        }
                        expect(recommendations.count).to(equal(1))
                        expect(recommendations.first?.title).to(equal("test-title"))
                        expect(recommendations.first?.excerpt).to(equal("test-excerpt"))
                        return .succeeded
                    }.toEventually(succeed())
                }

                it("is failed after receiving error") {
                    store.isThrowingError = true
                    await viewModel.load()

                    await expect {
                        let state = await viewModel.state
                        guard case .failed = state else {
                            return .failed(reason: "wrong enum case \(state)")
                        }
                        return .succeeded
                    }.toEventually(succeed())
                }
            }

            describe("triggers analytics") {
                it("when recommendation is open") {
                    await viewModel.trackRecommendationOpen(recommendationID: "id")
                    expect(tracker.calls).to(contain("trackRecommendationOpen(recommendationID:)"))
                }

                it("when recommendation is shared") {
                    await viewModel.trackRecommendationShare(recommendationID: "id")
                    expect(tracker.calls).to(contain("trackRecommendationShare(recommendationID:)"))
                }

                it("when discover screen is viewed") {
                    await viewModel.trackDiscoverScreenImpression()
                    expect(tracker.calls).to(contain("trackDiscoverScreenImpression()"))
                }

                it("when recommendation is viewed") {
                    await viewModel.trackRecommendationImpression(recommendationID: "id")
                    expect(tracker.calls).to(contain("trackRecommendationImpression(recommendationID:)"))
                }
            }
        }
    }
}
