// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI
import Combine
import DesignKit

public struct ReadingListCell: View {
    let model: ReadingListCellViewModel
    let archiveAction: (String) -> Void
    let shareAction: (String) -> Void

    public var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(model.title)
                        .font(.headline)
                    Text(model.subtitle)
                        .font(.footnote)
                }
                Spacer()
                AsyncImage(url: URL(string: model.thumbnailURL ?? "")) { phase in
                    switch phase {
                    case .empty:
                        EmptyView()
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: Constants.thumbnailSize.width, height: Constants.thumbnailSize.height)
                    case .failure:
                        Image(systemName: "photo")
                            .frame(width: Constants.thumbnailSize.width, height: Constants.thumbnailSize.height)
                    @unknown default:
                        EmptyView()
                            .frame(width: Constants.thumbnailSize.width, height: Constants.thumbnailSize.height)
                    }
                }
                .frame(width: Constants.thumbnailSize.width, height: Constants.thumbnailSize.height)
                .cornerRadius(Constants.cornerRadius)
            }
            HStack {
                Spacer()
                Image(.archive)
                    .renderingMode(.template)
                    .contentShape(Rectangle())
                    .accessibility(addTraits: .isButton)
                    .frame(width: Constants.buttonSize.width, height: Constants.buttonSize.height)
                    .buttonStyle(.bordered)
                    .onTapGesture {
                        archiveAction(model.contentURL)
                    }

                ShareLink(item: model.contentURL) {
                    Image(.share)
                        .renderingMode(.template)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    shareAction(model.contentURL)
                })
                .contentShape(Rectangle())
                .frame(width: Constants.buttonSize.width, height: Constants.buttonSize.height)
                .buttonStyle(.plain)
                .accessibility(addTraits: .isButton)
            }
        }
        .padding()
        .contentShape(Rectangle())
    }

    // MARK: - Constants

    private enum Constants {
        static let thumbnailSize: CGSize = CGSize(width: 80, height: 80)
        static let buttonSize: CGSize = CGSize(width: 48, height: 48)
        static let cornerRadius: CGFloat = 8.0
    }
}
