// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Combine
import MoSoClient

protocol RecommendationsStore {
    var recommendations: [Recommendation] { get }
    var recommendationsPublisher: Published<[Recommendation]>.Publisher { get }
    func fetchRecommendations(count: Int) async throws
    // TODO: in a complete implementationm, this call will likely be async too, performing an actual search
    func searchRecommendations(by term: String)
    func clearSearch()
}

final class InMemoryRecommendationsStore: RecommendationsStore, ObservableObject {
    private let client: RemoteClient
    // in-memory storage
    private var storage: [Recommendation] = []
    @Published public private(set) var recommendations: [Recommendation] = []
    public var recommendationsPublisher: Published<[Recommendation]>.Publisher { $recommendations }

    init(client: RemoteClient) {
        self.client = client
    }

    func fetchRecommendations(count: Int) async throws {
        let remoteRecommendations = try await client.getRecommendations(count: count)
        recommendations = remoteRecommendations.map { Recommendation(from: $0) }
        storage = recommendations
    }

    func searchRecommendations(by term: String) {
        let lowercasedTerm = term.lowercased()
        let filteredList = self.storage.filter { $0.title.lowercased().contains(term) }
        recommendations = filteredList
    }

    func clearSearch() {
        recommendations = storage
    }
}
