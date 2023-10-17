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

    init(recommendations: [Recommendation]) {
        self.recommendations = recommendations
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.mosoLayerColor1).ignoresSafeArea()
                    ListView(recommendations: recommendations)
                        .navigationDestination(for: Recommendation.self) { recommendation in
                            RecommendationDetailView(recommendation: recommendation)
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbarBackground(.visible, for: .navigationBar)
                                .toolbarBackground(Color(.mosoLayerColor1), for: .navigationBar)
                                .onAppear {
                                    viewModel.trackRecommendationOpen(recommendationID: recommendation.recommendationID)
                                }
                        }
                        .if(sizeClass == .regular) { view in
                            view.frame(width: RecommendationsView.maxReadableWidth, alignment: .center)
                        }
            }
            .navigationTitle(Text("Today's Top Picks"))
        }
        .onAppear {
            viewModel.trackDiscoverScreenImpression()
        }
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
        .refreshable {
            viewModel.load()
        }
    }
}
