// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// ref. https://www.swiftbysundell.com/articles/handling-loading-states-in-swiftui/

import Foundation

public enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case ready(Value)

    public var isEmpty: Bool {
        switch self {
        case .failed, .idle:
            return true
        default:
            return false
        }
    }
}
