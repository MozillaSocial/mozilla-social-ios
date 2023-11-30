// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation

// TODO: this very simple implementation will change
public class MoSoUser {
    public let username: String
    public let identifier: String
    @KeychainStorage public var session: MoSoSession?
    @KeychainStorage public var pocketSession: MoSoSession? {
        didSet {
            NotificationCenter.default.post(name: .userAuthDidChange, object: nil)
        }
    }

    public init(username: String, identifier: String, session: MoSoSession? = nil) {
        self.username = username
        self.identifier = identifier

        _session = KeychainStorage(account: "session")
        _pocketSession = KeychainStorage(account: "pocketSession")
    }
}

public extension Notification.Name {
    static var userAuthDidChange: Notification.Name {
        .init("userAuthDidChange")
    }
}
