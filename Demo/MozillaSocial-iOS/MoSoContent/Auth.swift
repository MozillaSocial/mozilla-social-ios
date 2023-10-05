// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import AuthenticationServices

let isProd = false
let baseURL = isProd ? "https://mozilla.social" : "https://stage.moztodon.nonprod.webservices.mozgcp.net"
let redirectScheme = "mozillasocial"
let redirectURI = redirectScheme + "://auth"

class Auth: NSObject, ASWebAuthenticationPresentationContextProviding {

    var authToken: Token?

    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }

    func registerApp() async -> ClientEntity? {
        var urlRequest = URLRequest(url: registerAppURL())
        urlRequest.httpMethod = "POST"

        do{
            let (data, _) = try await URLSession.shared.data(for: urlRequest)

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(ClientEntity.self, from: data)
        } catch {
            print("error: ", error)
            return nil
        }
    }

    func signIn(client: ClientEntity) {
        var authURL = signInURL(with: client.clientId)

        let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: redirectScheme) { (url, error) in
            guard error == nil else {
                print("ERROR: \(String(describing: error))")
                return
            }

            guard let url = url, let code = self.parseCode(from: url) else {
                print("Invalid Code Return")
                return
            }

            Task {
                self.authToken = await self.fetchAuthToken(for: client, with: code)
            }
        }

        session.presentationContextProvider = self
        session.prefersEphemeralWebBrowserSession = true
        session.start()
    }

    private func fetchAuthToken(for client: ClientEntity, with code: String) async -> Token? {
        var urlRequest = URLRequest(url: authTokenURL(for: client, with: code))
        urlRequest.httpMethod = "POST"
        do{
            let (data, _) = try await URLSession.shared.data(for: urlRequest)

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            return try decoder.decode(Token.self, from: data)
        } catch {
            print("error: ", error)
        }

        return nil
    }

    // MARK: - URL Builders

    private func authTokenURL(for client: ClientEntity, with code: String) -> URL {
        guard var url = URL(string: baseURL + "/oauth/token") else {
            fatalError()
        }

        url.append(queryItems:[URLQueryItem(name: "code", value: code),
                               URLQueryItem(name: "grant_type", value: "authorization_code"),
                               URLQueryItem(name: "redirect_uri", value: redirectURI),
                               URLQueryItem(name: "client_secret", value: client.clientSecret),
                               URLQueryItem(name: "client_id", value: client.clientId),
                               URLQueryItem(name: "scope", value: "read+write+push+follow")])
        return url
    }

    private func registerAppURL() -> URL {
        guard var registerURL = URL(string: baseURL + "/api/v1/apps") else {
            fatalError()
        }

        registerURL.append(queryItems: [URLQueryItem(name: "client_name", value: "MozillaSocialDemo"),
                                        URLQueryItem(name: "redirect_uris", value: redirectURI),
                                        URLQueryItem(name: "scopes", value: "read write push follow")])
        return registerURL
    }

    private func signInURL(with clientId: String) -> URL {
        var signInURL = URL(string: baseURL + "/oauth/authorize")!
        signInURL.append(queryItems: [URLQueryItem(name: "response_type", value: "code"),
                                      URLQueryItem(name: "client_id", value: clientId),
                                      URLQueryItem(name: "scope", value: "read+write+push+follow"),
                                      URLQueryItem(name: "redirect_uri", value: redirectURI)])
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
