// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI
import MoSoCore

// TODO: this is a very simple implementation for an image that loads async
// the native AsyncImage appears to still not be working properly
// we might want to use Kingfisher for images
struct AsyncImageView: View {
    private let url: URL
    @StateObject var loader: ImageLoader

    init(url: URL) {
        self.url = url
        self._loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    var body: some View {
        AsyncContentView(source: loader) { uiImage in
            Image(uiImage: uiImage)
                .resizable()
                .cornerRadius(8.0)
        } errorContent: { _ in
            // TODO: we might want to do something different here if the image fails to load
            EmptyView()
        }
    }
}
