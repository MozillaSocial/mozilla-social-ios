// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Combine
import MoSoClient

// TODO: this is just a placeholder for now
final class PreviewStore: RecommendationsStore {
    func clearSearch() {
    }
    
    @Published var recommendations: [Recommendation] = []
    public var recommendationsPublisher: Published<[Recommendation]>.Publisher { $recommendations }

    func fetchRecommendations(count: Int) async throws {

    }
    
    func searchRecommendations(by term: String) {

    }
}
