// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI
import Combine

public struct ReadingListView: View {
    public init(model: ReadingListModel) {
        self.model = model
    }
    @ObservedObject var model: ReadingListModel
    @State private var selectedRow: ReadingListCellViewModel?

    @Environment(\.horizontalSizeClass)
    var sizeClass
    @Environment(\.openURL)
    var openURL

    public var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(model.readingListItems, id: \.id) { viewModel in
                        ReadingListCell(model: viewModel, selectedRow: $selectedRow)
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbarBackground(.visible, for: .navigationBar)
                            .toolbarBackground(Color(.mosoLayerColor1), for: .navigationBar)
                            .onAppear {
                                model.didDisplay(item: viewModel)
                            }
                            .if(sizeClass == .regular) { view in
                                view.frame(width: 700, alignment: .center)
                            }
                    }
                    if model.allItemsAreDownloaded() == false {
                        ProgressView()
                    }
                }
                .navigationTitle(Text("Reading List"))
            }
            .onChange(of: selectedRow) { newValue in
                guard let urlString = newValue?.contentURL,
                      let url = URL(string: urlString) else {
                    print("Could not create URL")
                    return
                }
                selectedRow = nil
                openURL(url)
            }
        }
    }
}
