// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import SwiftUI

struct LoginView: View {
    @ObservedObject var auth = Auth()

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 70, height: 70)
                VStack(alignment: .leading) {
                    HStack {
                        Text("DisplayName:")
                        Text(auth.accountDetails?.displayName ?? "-")
                    }
                    HStack {
                        Text("Username:")
                        Text(auth.accountDetails?.username ?? "-")
                    }
                    HStack {
                        Text("AccountID:")
                        Text(auth.accountDetails?.id ?? "-")
                    }
                }
            }
        }
        .padding()
        .background(Color.purple)
        .clipShape(.rect(cornerRadius: 10))
        .overlay(loginOverlay)
    }

    @ViewBuilder private var loginOverlay: some View {
        if auth.authToken == nil {
            VStack {
                Image("MoSoIcon")
                    .resizable()
                    .frame(width:200, height:200)
                    .clipShape(.rect(cornerRadius: 10))
                Spacer()
                Button("Sign in/Sign up") {
                    Task {
                        guard let client = await auth.registerApp() else {
                            print("Unable to get ClientEntity")
                            return
                        }
                        auth.signIn(client: client)
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .padding()
            .background(Color.gray)
            .clipShape(.rect(cornerRadius: 10))
        }
    }
}

#Preview {
    LoginView()
}
