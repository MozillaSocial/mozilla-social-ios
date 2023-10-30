// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Combine

@testable import DiscoverKit

/// Mock of `RecommendationsStore` used in tests
final class MockStore: RecommendationsStore {
    var isThrowingError: Bool = false

    func clearSearch() {
    }

    @Published var recommendations: [Recommendation] = []
    public var recommendationsPublisher: Published<[Recommendation]>.Publisher { $recommendations }

    func fetchRecommendations(count: Int) async throws {
        if isThrowingError {
            throw MockError.fetchRecommendationsError
        }
        recommendations = [Recommendation(recommendationID: "id", url: "test-url", title: "test-title", excerpt: "test-excerpt", publisher: "test-publisher", imageUrl: nil)]
    }

    func searchRecommendations(by term: String) {
    }
}
