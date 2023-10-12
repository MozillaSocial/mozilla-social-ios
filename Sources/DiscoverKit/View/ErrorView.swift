// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var viewModel: DiscoverViewModel
    let error: Error

    var body: some View {
        // TODO: add proper error logging
        ScrollView {
            ZStack {
                Color(.mosoLayerColor1).ignoresSafeArea()
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sorry, Something went wrong")
                        .font(.title)
                    Text("We are all about a healthy internet but sometimes things break.")
                        .font(.headline)
                    Spacer()
                }
                .padding()
            }
        }
        .refreshable {
            viewModel.load()
        }
    }
}

#Preview {
    ErrorView(error: NSError(domain: "Preview", code: 0))
}
