// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

public struct ReadingListView: View {
    public init() {}
    private let model = ReadingListModel()

    public var body: some View {
        Text("Coming Soon")
        Button("Log in to Pocket") {
            model.beginLoginFlow()
        }
    }
}

#Preview {
    ReadingListView()
}
