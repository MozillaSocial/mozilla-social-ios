// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI
import MoSoCore

struct LoginView: View {
    @StateObject var mosoAuth = AuthenticationService()
    @StateObject var pocketAuth = PocketAuthenticationService(consumerKey: Keys.shared.pocketAPIConsumerKey)
    let sessionManager: MoSoSessionManager

    var body: some View {
        VStack {
            Spacer()
            accountInfo
                .overlay(loginOverlay)
            Spacer()
            Button("Sign out of Pocket") {
                sessionManager.user?.pocketSession = nil
            }
                .overlay(pocketLoginOverlay)
            Spacer()
        }
    }

    @ViewBuilder private var accountInfo: some View {
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

    @ViewBuilder private var pocketLoginOverlay: some View {
        if (try? sessionManager.pocketSession()) == nil {
            VStack {
                Image("pocketIcon")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(.rect(cornerRadius: 10))
                Spacer()
                HStack {
                    Button("Sign in") {
                        Task {
                            guard let authResponse = try? await pocketAuth.logIn() else { return }
                            let newSession = MoSoSession(token: authResponse.accessToken, guid: authResponse.guid)
                            sessionManager.user?.pocketSession = newSession
                        }
                    }
                    Button("Sign up") {
                        Task {
                            guard let authResponse = try? await pocketAuth.signUp() else { return }
                            let newSession = MoSoSession(token: authResponse.accessToken, guid: authResponse.guid)
                            sessionManager.user?.pocketSession = newSession
                        }
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
    LoginView(sessionManager: MoSoSessionManager())
}
