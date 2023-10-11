// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Glean

// TODO: complete method signatures with actual parameters
/// A protocol for an analytics module that tracks base events. Consumers can use a default
/// implementation offered by `AnalyticsProvider`, to send events to mozilla.social analytics platform
public protocol BaseTracker {
    func start()
    func stop()
    func trackImpression(mastodonID: String, recommendationID: String)
    func trackEngagement(mastodonID: String, recommendationID: String)
}

struct GleanBaseTracker: BaseTracker {
    func start() {
        // TODO: initialize
    }

    func stop() {
        // TODO: shutdown
    }

    func trackImpression(mastodonID: String, recommendationID: String) {
    }

    func trackEngagement(mastodonID: String, recommendationID: String) {
    }
}
