// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

public struct ReadingListView: View {
    public init() {}
    private let pocketAuth = PocketAuthenticationService()

    public var body: some View {
        Text("Coming Soon")
        Button("Log in to Pocket") {
            Task {
                do {
                    let response = try await pocketAuth.logIn()
                    print(response)
                } catch {
                    print("Auth Error!")
                }
            }
        }
    }
}

#Preview {
    ReadingListView()
}
