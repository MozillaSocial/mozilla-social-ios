// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

struct RecommendationsView: View {
    let recommendations: [Recommendation]
    @EnvironmentObject var viewModel: DiscoverViewModel

    @Environment(\.horizontalSizeClass)
    var sizeClass

    /// Max readable width comes from our investigation we did in this PR: https://github.com/Pocket/pocket-ios/pull/763
    static let maxReadableWidth: CGFloat = 700

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.mosoLayerColor1).ignoresSafeArea()
                    ListView(recommendations: recommendations)
                        .navigationDestination(for: Recommendation.self) {
                            RecommendationDetailView(recommendation: $0)
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbarBackground(.visible, for: .navigationBar)
                                .toolbarBackground(Color(.mosoLayerColor1), for: .navigationBar)
                        }
                        .if(sizeClass == .regular) { view in
                            view.frame(width: RecommendationsView.maxReadableWidth, alignment: .center)
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
            // Workaround for removing ">"
            ZStack {
                RecommendationRow(recommendation: recommendation)
                NavigationLink(value: recommendation) {
                    EmptyView()
                }.opacity(0)
            }.listRowBackground(Color(.mosoLayerColor1))
        }
        .listStyle(.plain)
        .navigationTitle("Today's Top Picks")
        .refreshable {
            viewModel.load()
        }
    }
}
