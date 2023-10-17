// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation

/// Defines accessibility identifiers to elements
public struct AccessibilityIdentifiers {
    public struct Tab {
        public static let discover = "discover-tab-bar-button"
        public static let readingList = "readingList-tab-bar-button"
    }

    public struct Discover {
        public static let recommendationContent = "recommendation-content"
        public static let recommendationImage = "recommendation-image"
    }
}

/// Defines accessibility identifiers to elements
public struct AccessibilityLabels {
    public struct Tab {
        public static let discover = "discover"
        public static let readingList = "reading list"
    }

    public struct Discover {
        public static let recommendationImage = "image associated with recommendation item" // TODO: To be replaced by image alt text
    }
}
