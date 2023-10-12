// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Glean
import MoSoCore

// TODO: complete method signatures with actual parameters
/// A protocol for an analytics module that tracks base events. Consumers can use a default
/// implementation offered by `AnalyticsProvider`, to send events to mozilla.social analytics platform
public protocol BaseTracker {
    func start()
    func stop()
    func trackImpression(mastodonID: String, recommendationID: String)
    func trackEngagement(action: EngagementAction,
                         associatedValue: String?,
                         postID: String?,
                         recommendationID: String?,
                         additionalInfo: String?,
                         uiIdentifier: String?)
}

struct GleanBaseTracker: BaseTracker {
    private let session: MoSoSession

    init(session: MoSoSession) {
        self.session = session
        Glean.shared.setLogPings(true)
        Glean.shared.setDebugViewTag("moso-ios-test")
    }
    func start() {
        Glean.shared.initialize(
            uploadEnabled: true,
            buildInfo: GleanMetrics.GleanBuild.info
        )
    }

    func stop() {
        Glean.shared.shutdown()
    }

    func trackImpression(mastodonID: String, recommendationID: String) {
    }

    func trackEngagement(action: EngagementAction,
                         associatedValue: String?,
                         postID: String?,
                         recommendationID: String?,
                         additionalInfo: String?,
                         uiIdentifier: String?) {
        GleanMetrics.Ui.engagement.record(
            .init(
                engagementType: action.description,
                engagementValue: associatedValue,
                mastodonAccountHandle: session.user?.username,
                mastodonAccountId: session.user?.identifier,
                mastodonStatusId: postID,
                recommendationId: recommendationID,
                uiAdditionalDetail: additionalInfo,
                uiIdentifier: uiIdentifier
            )
        )
    }
}