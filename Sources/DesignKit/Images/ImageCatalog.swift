// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import SwiftUI

public extension Image {
    init(_ asset: ImageCatalog) {
        self.init(asset.rawValue, bundle: .module)
    }
}

public enum ImageCatalog: String {
    case discover = "discover"
    case discoverFill = "discover.fill"
    case save = "save"
    case saveFill = "save.fill"
    case share = "share"
}
