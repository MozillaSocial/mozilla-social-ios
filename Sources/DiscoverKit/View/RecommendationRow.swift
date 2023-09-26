// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import DesignKit
import SwiftUI

struct RecommendationRow: View {
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
        .padding(.top, 16)
        .padding(.bottom, 16)
    }

    func makeTextContentView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(recommendation.publisher)
                .font(.footnote)
            Text(recommendation.title)
                .font(.headline)
            Text(recommendation.excerpt)
                .font(.body)
        }
    }
    // TODO: in our final implementation, we might want to use Kingfisher for images
    func makeImageView() -> some View {
        VStack {
            if let urlString = recommendation.imageUrl, let url = URL(string: urlString) {
                AsyncImageView(url: url)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80.0, height: 80.0, alignment: .center)
                    .cornerRadius(8.0)
            }
            Spacer()
        }
    }

    func makeFooterView() -> some View {
        HStack {
            Spacer()
            Image(.save)
                .frame(width: 24, height: 24)
                .padding(.trailing, 16)
            ShareLink(item: recommendation.url) {
                Image(.share)
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    RecommendationRow(recommendation: Recommendation(url: "https://getpocket.com/home", title: "Pocket", excerpt: "Read it later", publisher: "Mozilla", imageUrl: nil))
}
