// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

public enum EngagementAction: String {
    case follow
    case post
    case reply
    case favorite
    case boost
    case bookmark
    case general
    case none

    var description: String? {
        switch self {
        case .none:
            return nil
        default:
            return rawValue
        }
    }
}
