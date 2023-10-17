// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import DesignKit
import MoSoCore
import SwiftUI

struct RootView: View {
    @StateObject var viewModel: DiscoverViewModel

    var body: some View {
        AsyncContentView(source: viewModel) { recommendations in
            RecommendationsView(recommendations: recommendations)
        } progressContent: {
            ZStack {
                Color(.mosoLayerColor1).ignoresSafeArea()
                ProgressView()
            }
        }
    errorContent: { error in
            ErrorView(error: error)
        }
        .background(Color(.mosoLayerColor1))
        .environmentObject(viewModel)
    }
}

#Preview {
    RootView(viewModel: DiscoverViewModel(store: PreviewStore(), tracker: PreviewTracker()))
}
