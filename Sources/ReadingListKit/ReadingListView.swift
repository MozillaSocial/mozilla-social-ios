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

    func archiveAction(item: String) {
        model.archive(item: item)
    }

    public var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(model.readingListItems, id: \.id) { viewModel in
                        ReadingListCell(model: viewModel, selectedRow: $selectedRow, archiveAction: self.archiveAction)
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbarBackground(.visible, for: .navigationBar)
                            .toolbarBackground(Color(.mosoLayerColor1), for: .navigationBar)
                            .onAppear {
                                model.didDisplay(item: viewModel)
                            }
                            .if(sizeClass == .regular) { view in
                                view.frame(width: Constants.readableWidth, alignment: .center)
                            }
                    }
                    if model.allItemsAreDownloaded() == false && model.displayMode == .normal {
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
            .onAppear {
                model.loadReadingList()
            }
            .overlay {
                if model.displayMode == .loggedOut {
                    Text("You need to log into your Pocket Account to view your Reading List") // TODO: Fix: Navigate away and then back to the tab and this is ignored.
                } else if model.displayMode == .empty {
                    Text("Your Reading List is empty!")
                }
            }
        }
    }

    // MARK: - Constants

    private enum Constants {
        static let readableWidth: CGFloat = 700
    }
}
