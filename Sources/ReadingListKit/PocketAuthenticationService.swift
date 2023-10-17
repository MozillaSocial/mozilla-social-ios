// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import AuthenticationServices
import Combine

struct Response {
    let guid: String
    let accessToken: String
    let userIdentifier: String
}

enum PocketAuthenticationError: Error {
    case invalidRedirect
    case invalidComponents
    case alreadyAuthenticating
    case noConsumerKey
    case other(Swift.Error)
}

class PocketAuthenticationService: NSObject, ASWebAuthenticationPresentationContextProviding {
    private var isAuthenticating = false

    @MainActor
    func logIn() async throws -> Response {
        defer { isAuthenticating = false }

        guard isAuthenticating == false else {
            throw PocketAuthenticationError.alreadyAuthenticating
        }

        isAuthenticating = true
        return try await authenticate(with: "/login", contextProvider: self)
    }

    @MainActor
    func signUp() async throws -> Response {
        defer { isAuthenticating = false }

        guard isAuthenticating == false else {
            throw PocketAuthenticationError.alreadyAuthenticating
        }

        isAuthenticating = true
        return try await authenticate(with: "/signup", contextProvider: self)
    }

    private func authenticate(with path: String, contextProvider: ASWebAuthenticationPresentationContextProviding?) async throws -> Response {
        guard var components = URLComponents(string: "https://getpocket.com") else {
            throw PocketAuthenticationError.invalidComponents
        }

        let requestRedirect = "pocket"
        let consumerKey: String? = nil

        components.path = path
        components.queryItems = [
            URLQueryItem(name: "consumer_key", value: consumerKey),
            URLQueryItem(name: "redirect_uri", value: "\(requestRedirect)://fxa"),
            URLQueryItem(name: "utm_source", value: "ios_next")
        ]

        guard let requestURL = components.url else {
            throw PocketAuthenticationError.invalidComponents
        }

        return try await withCheckedThrowingContinuation { continuation in
            let session = ASWebAuthenticationSession(url: requestURL, callbackURLScheme: requestRedirect) { url, error in
                if let error = error {
                    continuation.resume(throwing: PocketAuthenticationError.other(error))
                }
                self.authReponse(from: url, with: continuation)
            }
            session.prefersEphemeralWebBrowserSession = true
            session.presentationContextProvider = contextProvider
            _ = session.start()
        }
    }

    private func authReponse(from url: URL?, with continuation: CheckedContinuation<Response, any Error>) {
        if let url = url {
            guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
                  let guid = components.queryItems?.first(where: { $0.name == "guid" })?.value,
                  let token = components.queryItems?.first(where: { $0.name == "access_token" })?.value,
                  let userID = components.queryItems?.first(where: { $0.name == "id" })?.value else {
                continuation.resume(throwing: PocketAuthenticationError.invalidRedirect)
                return
            }

            let response = Response(guid: guid, accessToken: token, userIdentifier: userID)
            continuation.resume(returning: response)
        } else {
            continuation.resume(throwing: PocketAuthenticationError.invalidRedirect)
        }
    }

    // MARK: - AuthenticationServices Delegate

    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        DispatchQueue.main.sync {
            return ASPresentationAnchor()
        }
    }
}
