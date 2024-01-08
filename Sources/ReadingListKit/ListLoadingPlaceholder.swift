// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI
import DesignKit

struct ListLoadingPlaceholder: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Loading Title Text That Is Long")
                        .font(.headline)
                        .redacted(reason: .placeholder)
                    HStack {
                        Text("Source Outlet")
                            .redacted(reason: .placeholder)
                        Text(" • ")
                        Text("Time")
                            .redacted(reason: .placeholder)
                    }
                    .font(.footnote)
                }
                Spacer()
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .fill(.gray.opacity(0.5))
                    .frame(
                        width: Constants.thumbnailSize.width,
                        height: Constants.thumbnailSize.height
                    )
            }
            HStack {
                Spacer()
                Image(.archive)
                    .renderingMode(.template)
                    .contentShape(Rectangle())
                    .accessibility(addTraits: .isButton)
                    .frame(width: Constants.buttonSize.width, height: Constants.buttonSize.height)
                    .buttonStyle(.bordered)
                Image(.share)
                    .renderingMode(.template)
                    .contentShape(Rectangle())
                    .frame(width: Constants.buttonSize.width, height: Constants.buttonSize.height)
                    .buttonStyle(.plain)
                    .accessibility(addTraits: .isButton)
            }

            Divider()

            AnimationView(.loading, looping: true)
        }
        .padding()
    }

    private enum Constants {
        static let thumbnailSize: CGSize = CGSize(width: 80, height: 80)
        static let buttonSize: CGSize = CGSize(width: 48, height: 48)
        static let cornerRadius: CGFloat = 8.0
    }
}

#Preview {
    ListLoadingPlaceholder()
}
