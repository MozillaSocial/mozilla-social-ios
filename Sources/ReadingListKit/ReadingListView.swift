// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI
import Combine
import DesignKit

public struct ReadingListView: View {
    @StateObject var model: ReadingListModel

    @Environment(\.horizontalSizeClass)
    var sizeClass

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
                VStack {
                    NavigationLink(value: viewModel) {
                        ReadingListCell(model: viewModel, archiveAction: self.archiveAction, shareAction: self.shareAction)
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbarBackground(.visible, for: .navigationBar)
                            .toolbarBackground(Color(.mosoLayerColor1), for: .navigationBar)
                            .onAppear {
                                model.didDisplayItem(with: viewModel.id)
                                model.trackReadingListItemImpression(itemURL: viewModel.contentURL)
                            }
                            .if(sizeClass == .regular) { view in
                                view.frame(width: Constants.readableWidth, alignment: .center)
                            }
                    }
                    .buttonStyle(.plain)

                    Divider()
                }
                .fixedSize(horizontal: true, vertical: false)
            }
            if model.allItemsAreDownloaded() == false && model.displayMode == .normal {
                ProgressView()
            }
        }
        .navigationDestination(for: ReadingListCellViewModel.self) { viewModel in
            if let url = URL(string: viewModel.contentURL) {
                WebViewContainer(url: url)
                    .onAppear {
                        model.trackReadingListItemOpen(itemURL: viewModel.contentURL)
                    }
            }
        }
    }

    // MARK: - Constants

    private enum Constants {
        static let readableWidth: CGFloat = 700
    }
}
