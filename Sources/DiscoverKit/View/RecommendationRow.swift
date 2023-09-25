// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

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
        VStack(alignment: .leading) {
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
                    .frame(width: 80, height: 80)
            }
            Spacer()
        }
    }

    func makeFooterView() -> some View {
        HStack {
            Spacer()
            Image(systemName: "bookmark")
                .frame(width: 24, height: 24)
                .padding(.trailing, 16)
            Image(systemName: "square.and.arrow.up")
                .frame(width: 24, height: 24)
        }
    }
}

#Preview {
    RecommendationRow(recommendation: Recommendation(url: "https://getpocket.com/home", title: "Pocket", excerpt: "Read it later", publisher: "Mozilla", imageUrl: nil))
}
