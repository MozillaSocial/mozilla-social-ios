// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation

/// Session object for MoSoContent services
public struct MoSoSession {
    // TODO: this is a mere example, the real session object will be defined once we have more details on authorization and authentication
    public let isLoggedIn: Bool

    public init(isLoggedIn: Bool) {
        self.isLoggedIn = isLoggedIn
    }
}
