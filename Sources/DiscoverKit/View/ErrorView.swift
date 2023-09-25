// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var viewModel: DiscoverViewModel
    let error: Error

    var body: some View {
        // TODO: add implementation
        // TODO: add proper error logging
        Text("There was an error \(error.localizedDescription)")
            .refreshable {
                viewModel.load()
            }
    }
}

#Preview {
    ErrorView(error: NSError(domain: "Preview", code: 0))
}
