// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI
import DesignKit

public struct ReadingListCell: View {
    let model: ReadingListCellViewModel

    init(model: ReadingListCellViewModel) {
        self.model = model
    }

    public var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(model.title)
                    Text(model.subtitle)
                }
                Spacer()
                AsyncImage(url: model.thumbnailURL) { phase in
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
                Button("Fav") {
                    print("Favourite")
                }
                ShareLink(item: model.contentURL) {
                    Image(.share)
                        .renderingMode(.template)
                }
                .contentShape(Rectangle())
                .buttonStyle(.plain)
                .accessibility(addTraits: .isButton)
                .simultaneousGesture(
                    TapGesture().onEnded {
                        print("Share")
                    }
                )
                Button("Mo") {
                    print("More")
                }
            }
        }
        .padding()
    }

    // MARK: - Constants

    private enum Constants {
        static let width: CGFloat = 90
        static let height: CGFloat = 60
    }
}

#Preview {
    ReadingListCell(model: ReadingListCellViewModel(title: "A Very very very very long Test Title", subtitle: "Test Subtitle", thumbnailURL: URL(string: "data:image/png;base64,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")!, contentURL: URL(string: "www.getpocket.com")!))
}
