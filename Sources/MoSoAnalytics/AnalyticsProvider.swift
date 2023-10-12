// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// TODO: add implementations and configurations
public final class AnalyticsProvider {
    public let baseTracker: BaseTracker

    init(baseTracker: BaseTracker) {
        self.baseTracker = GleanBaseTracker()
        baseTracker.start()
    }

    public func makeDiscoverTracker() -> DiscoverTracker {
        MoSoDiscoverTracker(baseTracker: baseTracker)
    }

    /// Starts the analytics service. Useful if it gets stopped after init
    public func start() {
        baseTracker.start()
    }

    /// Stops sending events to the analytics service.
    public func stop() {
        baseTracker.stop()
    }
}
