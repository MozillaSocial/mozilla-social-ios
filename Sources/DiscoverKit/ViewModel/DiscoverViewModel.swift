// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Combine
import Foundation
import MoSoClient
import MoSoCore
import MoSoAnalytics

@MainActor
class DiscoverViewModel: LoadableObject {
    private let store: RecommendationsStore
    private let tracker: DiscoverTracker

    @Published var state: LoadingState<[Recommendation]> = .idle
    @Published var term = String()

    private var subscriptions = Set<AnyCancellable>()
    private var isSearching = false

    init(store: RecommendationsStore, tracker: DiscoverTracker) {
        self.store = store
        self.tracker = tracker

        store.recommendationsPublisher
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] recommendations in
                self?.state = .ready(recommendations)
        }
        .store(in: &subscriptions)

        $term
            .debounce(for: 1, scheduler: DispatchQueue.global())
            .sink { [weak self] term in
                // TODO: this is a rather simplistic implementation, will need to be updated
                guard let self else { return }
                self.isSearching = term.count >= 3 ? true : false
                if isSearching {
                    self.store.searchRecommendations(by: term)
                } else if term.isEmpty {
                    self.store.clearSearch()
                }
            }
            .store(in: &subscriptions)
    }

    func load() {
        if state.isEmpty {
            state = .loading
        }
        Task {
            do {
                try await store.fetchRecommendations(count: 30)
            } catch {
                self.state = .failed(error)
            }
        }
    }

    func trackRecommendationOpen(recommendationID: String) {
        tracker.trackRecommendationOpen(recommendationID: recommendationID)
    }

    func trackRecommendationShare(recommendationID: String) {
        tracker.trackRecommendationShare(recommendationID: recommendationID)
    }

    func trackRecommendationImpression(recommendationID: String) {
        tracker.trackRecommendationImpression(recommendationID: recommendationID)
    }
}
