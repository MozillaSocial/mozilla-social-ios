// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import MoSoCore

/// Provides access to MoSo analytics services.
/// The base service can be substituted with an external implementation.
/// Initializing this type will automatically start the service.
/// The service can be stopped and (re)started using the `stop()` and `start()` methods.
public final class AnalyticsProvider {
    public let baseTracker: BaseTracker

    public init(session: MoSoSessionManager, baseTracker: BaseTracker? = nil) {
        self.baseTracker = baseTracker ?? GleanBaseTracker(session: session)
        self.baseTracker.start()
    }

    /// Provides a concrete implementation of `DiscoverTracker`
    public func makeDiscoverTracker() -> DiscoverTracker {
        MoSoDiscoverTracker(baseTracker: baseTracker)
    }

    /// Provides a concrete implementation of `ReadingListTracker`
    public func makeReadingListTracker() -> ReadingListTracker {
        MoSoReadingListTracker(baseTracker: baseTracker)
    }

    /// Start the analytics service. Useful if it gets stopped after init
    public func start() {
        baseTracker.start()
    }

    /// Stop sending events to the analytics service.
    public func stop() {
        baseTracker.stop()
    }
}
