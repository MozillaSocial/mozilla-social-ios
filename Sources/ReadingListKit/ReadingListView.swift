// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI
import Combine

public struct ReadingListView: View {
    @StateObject var model: ReadingListModel
    @State private var selectedRow: ReadingListCellViewModel?

    @Environment(\.horizontalSizeClass)
    var sizeClass
    @Environment(\.openURL)
    var openURL

    func archiveAction(item: String) {
        model.archive(item: item)
        model.trackReadingListItemArchive(itemURL: item)
    }

    func shareAction(item: String) {
        model.trackReadingListItemShare(itemURL: item)
    }

    public var body: some View {
        NavigationStack {
            ScrollView {
                ReadingListContentView
                .navigationTitle(Text("Reading List"))
            }
            .onChange(of: selectedRow) { newValue in
                guard let urlString = newValue?.contentURL,
                      let url = URL(string: urlString) else {
                    return
                }
                selectedRow = nil
                openURL(url)
                model.trackReadingListItemOpen(itemURL: urlString)
            }
            .onAppear {
                model.trackReadingListViewImpression()
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

    @ViewBuilder private var ReadingListContentView: some View {
        LazyVStack {
            ForEach(model.readingListItems, id: \.id) { viewModel in
                ReadingListCell(model: viewModel, selectedRow: $selectedRow, archiveAction: self.archiveAction, shareAction: self.shareAction)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(.visible, for: .navigationBar)
                    .toolbarBackground(Color(.mosoLayerColor1), for: .navigationBar)
                    .onAppear {
                        model.didDisplay(item: viewModel)
                        model.trackReadingListItemImpression(itemURL: viewModel.contentURL)
                    }
                    .if(sizeClass == .regular) { view in
                        view.frame(width: Constants.readableWidth, alignment: .center)
                    }
            }
            if model.allItemsAreDownloaded() == false && model.displayMode == .normal {
                ProgressView()
            }
        }
    }

    // MARK: - Constants

    private enum Constants {
        static let readableWidth: CGFloat = 700
    }
}
