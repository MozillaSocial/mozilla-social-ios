// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// ref. https://www.swiftbysundell.com/articles/handling-loading-states-in-swiftui/

import SwiftUI

public struct AsyncContentView<Source: LoadableObject, Content: View, ProgressContent: View, ErrorContent: View>: View {
    @ObservedObject var source: Source
    var content: (Source.Output) -> Content
    var progressContent: () -> ProgressContent
    var errorContent: (Error) -> ErrorContent

    public init(source: Source,
                @ViewBuilder content: @escaping (Source.Output) -> Content,
                @ViewBuilder progressContent: @escaping () -> ProgressContent,
                @ViewBuilder errorContent: @escaping (Error) -> ErrorContent) {
        self.source = source
        self.content = content
        self.progressContent = progressContent
        self.errorContent = errorContent
    }

    public var body: some View {
        switch source.state {
        case .idle:
            Color.clear.task {
                source.load()
            }
        case .loading:
            progressContent()
        case .failed(let error):
            errorContent(error)
        case .ready(let output):
            content(output)
        }
    }
}
