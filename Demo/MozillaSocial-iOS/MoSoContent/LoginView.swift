// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import SwiftUI

struct LoginView: View {
    let auth = Auth()

    var body: some View {
        Button("Login!") {
            Task {
                guard let clientEntity = await auth.registerApp() else {
                    print("Client Entitiy Nil")
                    return
                }
                auth.signIn(client: clientEntity)
            }
        }
    }


}
