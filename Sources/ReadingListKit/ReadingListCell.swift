// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI
import Combine
import DesignKit

public struct ReadingListCell: View {
    let model: ReadingListCellViewModel
    @Binding var selectedRow: ReadingListCellViewModel?
    let archiveAction: (String) -> Void

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
                AsyncImage(url: URL(string: model.thumbnailURL)!) { phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "photo")
                            .frame(width: Constants.width, height: Constants.height)
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: Constants.width, maxHeight: Constants.height)
                    case .failure:
                        Image(systemName: "photo")
                            .frame(width: Constants.width, height: Constants.height)
                    @unknown default:
                        EmptyView()
                            .frame(width: Constants.width, height: Constants.height)
                    }
                }
                .frame(width: Constants.width, height: Constants.height)
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
                        print("Archive")
                        archiveAction(model.contentURL)
                    }

                ShareLink(item: model.contentURL) {
                    Image(.share)
                        .renderingMode(.template)
                }
                .contentShape(Rectangle())
                .frame(width: Constants.buttonSize.width, height: Constants.buttonSize.height)
                .buttonStyle(.plain)
                .accessibility(addTraits: .isButton)
            }
        }
        .padding()
        .contentShape(Rectangle())
        .onTapGesture {
            selectedRow = model
        }
    }

    // MARK: - Constants

    private enum Constants {
        static let width: CGFloat = 90
        static let height: CGFloat = 60
        static let buttonSize: CGSize = CGSize(width: 48, height: 48)
    }
}
