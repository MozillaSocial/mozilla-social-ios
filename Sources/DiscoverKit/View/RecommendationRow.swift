// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import DesignKit
import SwiftUI

struct RecommendationRow: View {
    @EnvironmentObject var viewModel: DiscoverViewModel
    let recommendation: Recommendation

    var body: some View {
        VStack {
            HStack(alignment: .top) {
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
        .accessibilityElement(children: .combine)
        .accessibilityIdentifier(AccessibilityIdentifiers.Discover.recommendationContent)
    }

    // TODO: in our final implementation, we might want to use Kingfisher for images
    func makeImageView() -> some View {
        VStack {
            if let urlString = recommendation.imageUrl, let url = URL(string: urlString) {
                AsyncImageView(url: url)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: Constants.thumbnailSize, height: Constants.thumbnailSize, alignment: .center)
                    .cornerRadius(Constants.cornerRadius)
                    .accessibilityLabel(AccessibilityLabels.Discover.recommendationImage)
                    .accessibilityIdentifier(AccessibilityIdentifiers.Discover.recommendationImage)
            }
            Spacer()
        }
    }

    func makeFooterView() -> some View {
        HStack {
            Spacer()
            Image(.save)
                .renderingMode(.template)
                .frame(width: Constants.buttonSize, height: Constants.buttonSize)
                .contentShape(Rectangle())
                .accessibility(addTraits: .isButton)
            ShareLink(item: recommendation.url) {
                Image(.share)
                    .renderingMode(.template)
            }
            .gesture(
                TapGesture().onEnded {
                    viewModel.trackRecommendationShare(recommendationID: recommendation.recommendationID)
                }
            )
            .frame(width: Constants.buttonSize, height: Constants.buttonSize)
            .contentShape(Rectangle())
            .buttonStyle(.plain)
            .accessibility(addTraits: .isButton)
        }
    }
}

private extension RecommendationRow {
    enum Constants {
        static let padding: CGFloat = 16
        static let spacing: CGFloat = 4
        static let lineLimit: Int = 5
        static let buttonSize: CGFloat = 48
        static let thumbnailSize: CGFloat = 80
        static let cornerRadius: CGFloat = 8.0
    }
}

#Preview {
    RecommendationRow.previewRow
        .padding()
        .dynamicTypeSize(.large)
}

#Preview {
    RecommendationRow.previewRow
        .padding()
            .dynamicTypeSize(.xLarge)
}

#Preview {
    ScrollView {
        RecommendationRow.previewRow
            .padding()
            .dynamicTypeSize(.accessibility1)
    }
}

#Preview {
    ScrollView {
        RecommendationRow.previewRow
            .padding()
            .dynamicTypeSize(.accessibility5)
    }
}

private extension RecommendationRow {
    static let previewRow = RecommendationRow(recommendation: Recommendation(recommendationID: "1", url: "https://getpocket.com/home", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", excerpt: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Suspendisse potenti nullam ac tortor. Massa sapien faucibus et molestie ac. Lacinia quis vel eros donec ac odio tempor orci. Velit dignissim sodales ut eu sem integer vitae justo eget. Quisque egestas diam in arcu cursus. Mi eget mauris pharetra et ultrices neque ornare aenean. Ultricies mi quis hendrerit dolor. Lacus laoreet non curabitur gravida. Nullam vehicula ipsum a arcu cursus.", publisher: "Mozilla", imageUrl: "https://pocket-image-cache.com/648x/filters:format(png):extract_focal()/https%3A%2F%2Fs3.us-east-1.amazonaws.com%2Fpocket-collectionapi-prod-images%2F399ed0f1-fcbb-4193-92fa-03caa86e63c8.png"))
}
