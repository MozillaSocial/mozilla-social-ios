// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI
import WebKit

// TODO: at this moment, this just loads an url in a web view. We will add a proper recommendation view after beta

public struct WebViewContainer: View {
    private let webView: WebView

    public init(url: URL) {
        self.webView = WebView(url: url)
    }

    public var body: some View {
        VStack {
            webView

            HStack {
                Button(action: {
                    webView.goBack()
                }, label: {
                    Image(systemName: "arrow.backward")
                        .padding()
                })
                Button(action: {
                    webView.goForward()
                }, label: {
                    Image(systemName: "arrow.forward")
                        .padding()
                })
                Button(action: {
                    webView.reload()
                }, label: {
                    Image(systemName: "arrow.clockwise")
                        .padding()
                })

                Spacer()
            }
            .padding()
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    private let webView: WKWebView

    init(url: URL) {
        self.url = url
        self.webView = WKWebView()
        webView.backgroundColor = UIColor(.mosoLayerColor1)
    }

    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }

    func goBack() {
        webView.goBack()
    }

    func goForward() {
        webView.goForward()
    }

    func reload() {
        webView.reload()
    }
}
