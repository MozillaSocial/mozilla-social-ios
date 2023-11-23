// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

struct LoginView: View {
    @StateObject var mosoAuth = AuthenticationService()

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 70, height: 70)
                VStack(alignment: .leading) {
                    HStack {
                        Text("DisplayName:")
                        Text(mosoAuth.accountDetails?.displayName ?? "-")
                    }
                    HStack {
                        Text("Username:")
                        Text(mosoAuth.accountDetails?.username ?? "-")
                    }
                }
            }
            .padding()
            .background(Color.purple)
            .clipShape(.rect(cornerRadius: 10))
            VStack {
                HStack {
                    Text("Followers:")
                    if let count = mosoAuth.accountDetails?.followersCount {
                        Text(String(count))
                    } else {
                        Text("-")
                    }
                }
                HStack {
                    Text("Following:")
                    if let count = mosoAuth.accountDetails?.followingCount {
                        Text(String(count))
                    } else {
                        Text("-")
                    }
                }
                HStack {
                    Text("Toots:")
                    if let count = mosoAuth.accountDetails?.statusesCount {
                        Text(String(count))
                    } else {
                        Text("-")
                    }
                }
            }
            .padding()
            .background(Color.purple)
            .clipShape(.rect(cornerRadius: 10))
        }
        .overlay(loginOverlay)
    }

    @ViewBuilder private var loginOverlay: some View {
        if mosoAuth.authToken == nil {
            VStack {
                Image("MoSoIcon")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(.rect(cornerRadius: 10))
                Spacer()
                Button("Sign in/Sign up") {
                    mosoAuth.launchOAUTH()
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
