// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI
import WebKit

// TODO: at this moment, this just loads an url in a web view. We will add a proper recommendation view after beta
struct RecommendationDetailView: UIViewRepresentable {
    let recommendation: Recommendation

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        // TODO: this is just an example fallback, we need to add a proper error view
        let url = URL(string: recommendation.url) ?? URL(string: "https.getpocket.com")!
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
