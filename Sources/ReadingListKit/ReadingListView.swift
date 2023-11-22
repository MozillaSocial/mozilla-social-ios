// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

public struct ReadingListView: View {
    public init(model: ReadingListModel) {
        self.model = model
    }
    @ObservedObject var model: ReadingListModel

    public var body: some View {
        Text("ReadingList!")
        ScrollView {
            LazyVStack {
                ForEach(model.readingListItems, id: \.id) { viewModel in
                    ReadingListCell(model: viewModel)
                        .onAppear {
                            model.didDisplay(item: viewModel)
                        }
                }
            }
        }
    }
}
