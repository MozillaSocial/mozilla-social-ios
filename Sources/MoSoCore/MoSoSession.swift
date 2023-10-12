// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// TODO: this very simple implementation will change
public class MoSoSession {
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
}
