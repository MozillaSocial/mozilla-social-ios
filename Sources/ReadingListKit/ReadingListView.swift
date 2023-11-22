// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

public struct ReadingListView: View {
    public init(model: ReadingListModel) {
        self.model = model
    }
    @ObservedObject var model: ReadingListModel

    @Environment(\.horizontalSizeClass)
    var sizeClass

    public var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(model.readingListItems, id: \.id) { viewModel in
                        ReadingListCell(model: viewModel)
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbarBackground(.visible, for: .navigationBar)
                            .toolbarBackground(Color(.mosoLayerColor1), for: .navigationBar)
                            .onAppear {
                                model.didDisplay(item: viewModel)
                            }
                    }
                }
                .if(sizeClass == .regular) { view in
                    view.frame(width: 700, alignment: .center)
                }
            }
            .navigationTitle(Text("Reading List"))
        }
    }
}
