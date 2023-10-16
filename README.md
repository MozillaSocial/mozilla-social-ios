# Mozilla Social for iOS
 [![SwiftPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat)](https://swift.org/package-manager/) [![License: MPL 2.0](https://img.shields.io/badge/License-MPL_2.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)

Mozilla-social-ios is a client for our Mozilla Social product. It is structured as a single Swift Package that contains a variety of libraries that can be added to a full featured app. Contents are provided by the Mozilla Social Content api.

## Installation
Mozilla Social iOS supports [Swift Package Manager](https://github.com/apple/swift-package-manager)

To install Mozilla Social iOS using [Swift Package Manager](https://github.com/apple/swift-package-manager) you can follow the [tutorial published by Apple](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) using the URL for the Mozilla Social iOS repo with the current version:

1. In Xcode, select “File” → “Add Packages...”
1. Enter https://github.com/MozillaSocial/mozilla-social-ios

or you can add the following dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/MozillaSocial/mozilla-social-ios", from: "1.0.0")
```

## Available Libraries

### MoSoCore
Contains shared types used by all other libraries like `MoSoSession` and `MoSoUser`
### MoSoAnalytics
An analytics library that uses Mozilla's Glean. Offers two protocols to replace the default implementation with your own analytics engine

#### BaseTracker
defines base `impression` (a UI element appearing on screen) and `engagement` (an user action) events, and two methods to start and stop the analytics engine

```swift
public protocol BaseTracker {
    func start()
    func stop()
    func trackImpression(postID: String?,
                         recommendationID: String?,
                         additionalInfo: String?,
                         uiIdentifier: String?)
    func trackEngagement(action: EngagementAction,
                         associatedValue: String?,
                         postID: String?,
                         recommendationID: String?,
                         additionalInfo: String?,
                         uiIdentifier: String?)
}
```

where `EngagementAction` is an enum containing a variety of user actions

```swift
public enum EngagementAction: String {
    case follow
    case post
    case reply
    case favorite
    case boost
    case bookmark
    case share
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
```
#### DiscoverTracker
Offers specialized methods to track events in the `DiscoverKit` library

```swift
public protocol DiscoverTracker {
    func trackRecommendationOpen(recommendationID: String)
    func trackRecommendationShare(recommendationID: String)
    func trackRecommendationBookmark(recommendationID: String)
    func trackDiscoverScreenImpression()
    func trackRecommendationImpression(recommendationID: String)
}
```

Basic usage

```swift
import MoSoCore
import MoSoAnalytics

let user = MoSoUser(...)
let session = MoSoSession(user: user)
let analyticsProvider = AnalyticsProvider(session: session)
let discoverTracker = analyticsProvider.makeDiscoverTracker()
...
```
alternatively, you can inject your implementation of `BaseTracker` and `DiscoverTracker`

```swift
import MoSoAnalytics

class MyBaseTracker: DiscoverTracker {
...
}

let analyticsProvider = AnalyticsProvider(session: session, baseTracker: MyBaseTracker())
let discoverTracker = analyticsProvider.makeDiscoverTracker()
...
```

```swift
import MoSoAnalytics

class MyDiscoverTracker: DiscoverTracker {
...
}

let discoverTracker = MyDiscoverTracker()
...
```

you can start and stop analytics services by calling
```swift
analyticsProvider.start()
```
and
```swift
analyticsProvider.stop()
```


### DiscoverKit
A library that provides UI to access a list of recommendations, backed by Mozilla Social recommendations api. You can add `DiscoverKit` to your app, then generate the `RootView` and use it where it best fits in your app UI.
 here's an example screenshot

 <P align=center>
<img height=450 src=https://github.com/MozillaSocial/mozilla-social-ios/assets/34376330/87420580-c0f1-4bd8-8b2a-e3c972025c98>
 </P>

Basic usage

```swift
import MoSoCore
import MoSoAnalytics
import DiscoverKit
import SwiftUI

let analyticsProvider = AnalyticsProvider(...)
let discoverTracker = analyticsProvider.makeDiscoverTracker()
discoverProvider  = DiscoverProvider(session: session, tracker: analyticsProvider.makeDiscoverTracker())
...
struct MyView: View {
    var body: some View {
        discoverProvider.makeDiscoverRootView()
    }
}
```

## Contributing
At this moment, only members of the Mozilla Social organization can contribute to this repo, open contribution will be available soon.

