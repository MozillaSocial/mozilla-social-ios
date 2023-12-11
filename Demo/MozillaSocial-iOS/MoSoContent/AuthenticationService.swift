// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import AuthenticationServices
import Combine

class AuthenticationService: NSObject, ASWebAuthenticationPresentationContextProviding, ObservableObject {
    @Published var authToken: Token?
    @Published var accountDetails: AccountDetails?

    private var subscribers: Set<AnyCancellable> = []

    private enum URLConstants {
        static let isProd = false
        static let baseURL = URLConstants.isProd ? "https://mozilla.social" : "https://stage.moztodon.nonprod.webservices.mozgcp.net"
        static let redirectScheme = "mozillasocial"
        static let redirectURI = URLConstants.redirectScheme + "://auth"
    }

    init(authToken: Token? = nil, accountDetails: AccountDetails? = nil) {
        super.init()

        self.authToken = authToken
        self.accountDetails = accountDetails

        $authToken.sink { recievedValue in
            guard let bearerToken = recievedValue?.accessToken else {
                return
            }
            Task {
                let accountDetails = await self.fetchAccountDetails(for: bearerToken)
                await MainActor.run {
                    self.accountDetails = accountDetails
                }
            }
        }
        .store(in: &subscribers)
    }

    func launchOAUTH() {
        Task {
            guard let client = await registerApp() else {
                print("Unable to get ClientEntity")
                return
            }
            signIn(client: client)
        }
    }

    func registerApp() async -> ClientEntity? {
        var urlRequest = URLRequest(url: registerAppURL())
        urlRequest.httpMethod = "POST"

        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(ClientEntity.self, from: data)
        } catch {
            print("RegisterAppError: ", error)
            return nil
        }
    }

    func signIn(client: ClientEntity) {
        let authURL = signInURL(with: client.clientId)

        let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: URLConstants.redirectScheme) { (url, error) in
            if let error = error {
                print("ASWebAuthenticationSessionError: \(error))")
                return
            }

            guard let url = url, let code = self.parseCode(from: url) else {
                print("Invalid Code Return")
                return
            }

            Task {
                let token = await self.fetchAuthToken(for: client, with: code)
                await MainActor.run {
                    self.authToken = token
                }
            }
        }

        session.presentationContextProvider = self
        session.prefersEphemeralWebBrowserSession = true
        session.start()
    }

    private func fetchAuthToken(for client: ClientEntity, with code: String) async -> Token? {
        var urlRequest = URLRequest(url: authTokenURL(for: client, with: code))
        urlRequest.httpMethod = "POST"
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            return try decoder.decode(Token.self, from: data)
        } catch {
            print("FetchAuthTokenError: ", error)
        }

        return nil
    }

    func fetchAccountDetails(for bearerToken: String) async -> AccountDetails? {
        guard let url = URL(string: URLConstants.baseURL + "/api/v1/accounts/verify_credentials") else {
            fatalError()
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            return try decoder.decode(AccountDetails.self, from: data)
        } catch {
            print("FetchAccountDetailsError: ", error)
        }

        return nil
    }

    // MARK: - AuthenticationServices Delegate

    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        DispatchQueue.main.sync {
            return ASPresentationAnchor()
        }
    }

    // MARK: - URL Builders

    private func authTokenURL(for client: ClientEntity, with code: String) -> URL {
        guard var url = URL(string: URLConstants.baseURL + "/oauth/token") else {
            fatalError()
        }

        url.append(queryItems: [URLQueryItem(name: "code", value: code),
                               URLQueryItem(name: "grant_type", value: "authorization_code"),
                               URLQueryItem(name: "redirect_uri", value: URLConstants.redirectURI),
                               URLQueryItem(name: "client_secret", value: client.clientSecret),
                               URLQueryItem(name: "client_id", value: client.clientId),
                               URLQueryItem(name: "scope", value: "read+write+push+follow")])
        return url
    }

    private func registerAppURL() -> URL {
        guard var registerURL = URL(string: URLConstants.baseURL + "/api/v1/apps") else {
            fatalError()
        }

        registerURL.append(queryItems: [URLQueryItem(name: "client_name", value: "MozillaSocialDemo"),
                                        URLQueryItem(name: "redirect_uris", value: URLConstants.redirectURI),
                                        URLQueryItem(name: "scopes", value: "read write push follow")])
        return registerURL
    }

    private func signInURL(with clientId: String) -> URL {
        var signInURL = URL(string: URLConstants.baseURL + "/oauth/authorize")!
        signInURL.append(queryItems: [URLQueryItem(name: "response_type", value: "code"),
                                      URLQueryItem(name: "client_id", value: clientId),
                                      URLQueryItem(name: "scope", value: "read+write+push+follow"),
                                      URLQueryItem(name: "redirect_uri", value: URLConstants.redirectURI)])
        return signInURL
    }

    // MARK: - URL Helpers

    private func parseCode(from url: URL) -> String? {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let queryItems = components?.queryItems
        let codeItem = queryItems?.first {
            $0.name == "code"
        }

        return codeItem?.value
    }
}

// MARK: - Data Models

public struct ClientEntity: Codable {
    public let clientId: String
    public let clientSecret: String
}

public struct Token: Codable {
    public let accessToken: String
    public let tokenType: String
    public let scope: String
}

struct AccountDetails: Decodable {
    var username: String
    var displayName: String
    var followersCount: Int
    var followingCount: Int
    var statusesCount: Int
}
