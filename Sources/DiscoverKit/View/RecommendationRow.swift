// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import DesignKit
import SwiftUI

struct RecommendationRow: View {
    private enum Constants {
        static let padding: CGFloat = 16
        static let spacing: CGFloat = 4
        static let lineLimit: Int = 5
        static let imageSize: CGFloat = 24
        static let thumbnailSize: CGFloat = 80
        static let cornerRadius: CGFloat = 8.0
    }

    let recommendation: Recommendation
    var body: some View {
        VStack {
            HStack {
                makeTextContentView()
                Spacer()
                makeImageView()
            }
            makeFooterView()
        }
        .padding(.top, Constants.padding)
        .padding(.bottom, Constants.padding)
    }

    func makeTextContentView() -> some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            Text(recommendation.publisher)
                .font(.footnote)
            Text(recommendation.title)
                .font(.headline)
            Text(recommendation.excerpt)
                .font(.body)
                .lineLimit(Constants.lineLimit)
        }
    }
    // TODO: in our final implementation, we might want to use Kingfisher for images
    func makeImageView() -> some View {
        VStack {
            if let urlString = recommendation.imageUrl, let url = URL(string: urlString) {
                AsyncImageView(url: url)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: Constants.thumbnailSize, height: Constants.thumbnailSize, alignment: .center)
                    .cornerRadius(Constants.cornerRadius)
            }
            Spacer()
        }
    }

    func makeFooterView() -> some View {
        HStack {
            Spacer()
            Image(.save)
                .renderingMode(.template)
                .frame(width: Constants.imageSize, height: Constants.imageSize)
                .padding(.trailing, Constants.padding)
            ShareLink(item: recommendation.url) {
                Image(.share)
                    .renderingMode(.template)
                    .frame(width: Constants.imageSize, height: Constants.imageSize)
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    RecommendationRow(recommendation: Recommendation(url: "https://getpocket.com/home", title: "Pocket", excerpt: "Read it later", publisher: "Mozilla", imageUrl: nil))
}
