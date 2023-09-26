// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

public extension Color {
    init(_ asset: ColorCatalog) {
        self.init(asset.rawValue, bundle: .module)
    }
}

public enum ColorCatalog: String {
    case mosoLayerColor1 = "moso-layer-color-1"
    case mosoIconColorAccent = "moso-icon-color-accent"
}
