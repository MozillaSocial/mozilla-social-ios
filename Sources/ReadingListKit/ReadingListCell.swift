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
    ReadingListCell(model: ReadingListCellViewModel(title: "A Very very very very long Test Title", subtitle: "Test Subtitle", thumbnailURL: URL(string: "https://helios-i.mashable.com/imagery/articles/05fACELrEVc4kAfNQbhhcVh/hero-image.fill.size_1248x702.v1667556469.png")!, contentURL: URL(string: "www.getpocket.com")!))
}
