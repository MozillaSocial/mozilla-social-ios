// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import MoSoCore

// TODO: add implementations and configurations
/// Provides access to MoSo analytics services.
/// Initializing this type will automatically start the service.
/// The service can be stopped and (re)started using the `stop()` and `start()` methods.
public final class AnalyticsProvider {
    public let baseTracker: BaseTracker

    public init(session: MoSoSession) {
        self.baseTracker = GleanBaseTracker(session: session)
        baseTracker.start()
    }

    public func makeDiscoverTracker() -> DiscoverTracker {
        MoSoDiscoverTracker(baseTracker: baseTracker)
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
