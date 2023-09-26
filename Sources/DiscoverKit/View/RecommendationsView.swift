// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

struct RecommendationsView: View {
    let recommendations: [Recommendation]
    @EnvironmentObject var viewModel: DiscoverViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.mosoLayerColor1).ignoresSafeArea()
                ListView(recommendations: recommendations)
                    .navigationDestination(for: Recommendation.self) {
                        RecommendationDetailView(recommendation: $0)
                            .navigationBarTitleDisplayMode(.inline)
                    }
            }
        }
        .searchable(text: $viewModel.term)
    }
}

struct ListView: View {
    let recommendations: [Recommendation]
    @EnvironmentObject var viewModel: DiscoverViewModel

    var body: some View {
        List(recommendations) { recommendation in
            NavigationLink(value: recommendation) {
                RecommendationRow(recommendation: recommendation)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Today's Top Picks")
        .refreshable {
            viewModel.load()
        }
    }
}
