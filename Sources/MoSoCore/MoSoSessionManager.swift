// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// TODO: this very simple implementation will change
public class MoSoSessionManager {
    public private(set) var user: MoSoUser?
    public var isLoggedIn: Bool {
        user != nil
    }

    public init(user: MoSoUser? = nil) {
        self.user = user
    }

    public func loggedIn(_ user: MoSoUser) {
        self.user = user
    }

    public func loggedOut() {
        user = nil
    }

    public func activeSession() throws -> MoSoSession {
        guard let user = user else {
            throw MoSoSessionError.UserNotLoggedIn
        }
        guard let session = user.session else {
            throw MoSoSessionError.UserSessionInvalid
        }
        return session
    }

    // Should be removed once the Mastodon Token supports Pocket API access
    public func pocketSession() throws -> MoSoSession {
        guard let user = user else {
            throw MoSoSessionError.UserNotLoggedIn
        }
        guard let session = user.pocketSession else {
            throw MoSoSessionError.UserSessionInvalid
        }
        return session
    }
}

public enum MoSoSessionError: Error {
    case UserNotLoggedIn
    case UserSessionInvalid
}

public struct MoSoSession: Codable, Equatable {
    public let token: String
    public let guid: String

    public init(token: String, guid: String) {
        self.token = token
        self.guid = guid
    }
}
