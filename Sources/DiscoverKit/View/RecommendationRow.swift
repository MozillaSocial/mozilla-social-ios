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
        .onAppear {
            viewModel.trackRecommendationImpression(recommendationID: recommendation.recommendationID)
        }
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
            .frame(width: Constants.buttonSize, height: Constants.buttonSize)
            .contentShape(Rectangle())
            .buttonStyle(.plain)
            .accessibility(addTraits: .isButton)
            .simultaneousGesture(
                TapGesture().onEnded {
                    viewModel.trackRecommendationShare(recommendationID: recommendation.recommendationID)
                }
            )
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
    RecommendationRow.preview
        .padding()
        .dynamicTypeSize(.large)
}

#Preview {
    RecommendationRow.preview
        .padding()
            .dynamicTypeSize(.xLarge)
}

#Preview {
    ScrollView {
        RecommendationRow.preview
            .padding()
            .dynamicTypeSize(.accessibility1)
    }
}

#Preview {
    ScrollView {
        RecommendationRow.preview
            .padding()
            .dynamicTypeSize(.accessibility5)
    }
}
