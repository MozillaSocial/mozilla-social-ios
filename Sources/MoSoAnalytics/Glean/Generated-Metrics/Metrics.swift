// -*- mode: Swift -*-

// AUTOGENERATED BY glean_parser v8.1.1. DO NOT EDIT. DO NOT COMMIT.

#if canImport(Foundation)
    import Foundation
#endif

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */


import Glean

// swiftlint:disable superfluous_disable_command
// swiftlint:disable nesting
// swiftlint:disable line_length
// swiftlint:disable identifier_name
// swiftlint:disable force_try

extension GleanMetrics {
    class GleanBuild {
        private init() {
            // Intentionally left private, no external user can instantiate a new global object.
        }

        public static let info = BuildInfo(buildDate: DateComponents(calendar: Calendar.current, timeZone: TimeZone(abbreviation: "UTC"), year: 2023, month: 12, day: 5, hour: 19, minute: 26, second: 24))
    }

    enum Backend {
        struct ObjectUpdateExtra: EventExtras {
            var objectState: String?
            var objectType: String?

            func toExtraRecord() -> [String: String] {
                var record = [String: String]()

                if let objectState = self.objectState {
                    record["object_state"] = String(objectState)
                }
                if let objectType = self.objectType {
                    record["object_type"] = String(objectType)
                }

                return record
            }
        }

        /// Event triggered by the backend to record the change in state of an object (e.g.
        /// API requests to the mozilla.social Mastodon server). In the future, we could
        /// potentially use this event to track changes in state to core Mastodon objects
        /// (e.g. accounts and posts).
        /// data_taxonomy:
        ///   data_categories: [system.operations]
        ///   data_uses: [analytics.reporting, personalize.content, functional.service]
        ///   data_subjects: [customer]
        ///   data_qualifier: [?]
        static let objectUpdate = EventMetricType<ObjectUpdateExtra>( // generated from backend.object_update
            CommonMetricData(
                category: "backend",
                name: "object_update",
                sendInPings: ["events"],
                lifetime: .ping,
                disabled: false
            )
            , ["object_state", "object_type"]
        )

    }

    enum Identifiers {
        /// The Adjust device ID for this user, if available.
        /// data_taxonomy:
        ///   data_categories: [user.device.device_id]
        ///   data_uses: [analytics.reporting]
        ///   data_subjects: [customer, visitor]
        ///   data_qualifier: [identified]
        static let adjustDeviceId = StringMetricType( // generated from identifiers.adjust_device_id
            CommonMetricData(
                category: "identifiers",
                name: "adjust_device_id",
                sendInPings: ["events"],
                lifetime: .application,
                disabled: false
            )
        )

        /// The user's FxA account ID, if available.
        /// data_taxonomy:
        ///   data_categories: [user.unique_id]
        ///   data_uses: [analytics.reporting, personalize.content]
        ///   data_subjects: [customer]
        ///   data_qualifier: [identified]
        static let fxaAccountId = StringMetricType( // generated from identifiers.fxa_account_id
            CommonMetricData(
                category: "identifiers",
                name: "fxa_account_id",
                sendInPings: ["events"],
                lifetime: .application,
                disabled: false
            )
        )

        /// The user's full account handle, with domain. For example,
        /// `account_name@mozilla.social`.
        /// data_taxonomy:
        ///   data_categories: [user.account.username]
        ///   data_uses: [analytics.reporting, personalize.content]
        ///   data_subjects: [customer]
        static let mastodonAccountHandle = StringMetricType( // generated from identifiers.mastodon_account_handle
            CommonMetricData(
                category: "identifiers",
                name: "mastodon_account_handle",
                sendInPings: ["events"],
                lifetime: .application,
                disabled: false
            )
        )

        /// The user's numeric account ID from Mastodon.
        /// data_taxonomy:
        ///   data_categories: [user.unique_id]
        ///   data_uses: [analytics.reporting, personalize.content]
        ///   data_subjects: [customer]
        ///   data_qualifier: [identified]
        static let mastodonAccountId = StringMetricType( // generated from identifiers.mastodon_account_id
            CommonMetricData(
                category: "identifiers",
                name: "mastodon_account_id",
                sendInPings: ["events"],
                lifetime: .application,
                disabled: false
            )
        )

        /// The device user agent string.
        /// data_taxonomy:
        ///   data_categories: [user.device]
        ///   data_uses: [analytics.reporting]
        ///   data_subjects: [customer, visitor]
        ///   data_qualifier: [n/a]
        static let userAgent = StringMetricType( // generated from identifiers.user_agent
            CommonMetricData(
                category: "identifiers",
                name: "user_agent",
                sendInPings: ["events"],
                lifetime: .application,
                disabled: false
            )
        )

    }

    enum Mobile {
        /// Event triggered when a user moves the mobile app to background by opening
        /// another app, returning to the home screen, or quitting the app.
        /// data_taxonomy:
        ///   data_categories: [user.behavior]
        ///   data_uses: [analytics.reporting]
        ///   data_subjects: [customer, visitor]
        ///   data_qualifier: [n/a]
        static let appBackground = EventMetricType<NoExtras>( // generated from mobile.app_background
            CommonMetricData(
                category: "mobile",
                name: "app_background",
                sendInPings: ["events"],
                lifetime: .ping,
                disabled: false
            )
            , []
        )

        /// Event triggered when a user moves the mobile app to foreground by starting the
        /// app or returning from the home screen/another app.
        /// data_taxonomy:
        ///   data_categories: [user.behavior]
        ///   data_uses: [analytics.reporting]
        ///   data_subjects: [customer, visitor]
        ///   data_qualifier: [n/a]
        static let appOpen = EventMetricType<NoExtras>( // generated from mobile.app_open
            CommonMetricData(
                category: "mobile",
                name: "app_open",
                sendInPings: ["events"],
                lifetime: .ping,
                disabled: false
            )
            , []
        )

    }

    enum Ui {
        struct EngagementExtra: EventExtras {
            var engagementType: String?
            var engagementValue: String?
            var index: Int32?
            var mastodonAccountHandle: String?
            var mastodonAccountId: String?
            var mastodonStatusId: String?
            var recommendationId: String?
            var uiAdditionalDetail: String?
            var uiIdentifier: String?
            var url: String?

            func toExtraRecord() -> [String: String] {
                var record = [String: String]()

                if let engagementType = self.engagementType {
                    record["engagement_type"] = String(engagementType)
                }
                if let engagementValue = self.engagementValue {
                    record["engagement_value"] = String(engagementValue)
                }
                if let index = self.index {
                    record["index"] = String(index)
                }
                if let mastodonAccountHandle = self.mastodonAccountHandle {
                    record["mastodon_account_handle"] = String(mastodonAccountHandle)
                }
                if let mastodonAccountId = self.mastodonAccountId {
                    record["mastodon_account_id"] = String(mastodonAccountId)
                }
                if let mastodonStatusId = self.mastodonStatusId {
                    record["mastodon_status_id"] = String(mastodonStatusId)
                }
                if let recommendationId = self.recommendationId {
                    record["recommendation_id"] = String(recommendationId)
                }
                if let uiAdditionalDetail = self.uiAdditionalDetail {
                    record["ui_additional_detail"] = String(uiAdditionalDetail)
                }
                if let uiIdentifier = self.uiIdentifier {
                    record["ui_identifier"] = String(uiIdentifier)
                }
                if let url = self.url {
                    record["url"] = String(url)
                }

                return record
            }
        }

        struct ImpressionExtra: EventExtras {
            var index: Int32?
            var mastodonAccountHandle: String?
            var mastodonAccountId: String?
            var mastodonStatusId: String?
            var recommendationId: String?
            var uiAdditionalDetail: String?
            var uiIdentifier: String?
            var url: String?

            func toExtraRecord() -> [String: String] {
                var record = [String: String]()

                if let index = self.index {
                    record["index"] = String(index)
                }
                if let mastodonAccountHandle = self.mastodonAccountHandle {
                    record["mastodon_account_handle"] = String(mastodonAccountHandle)
                }
                if let mastodonAccountId = self.mastodonAccountId {
                    record["mastodon_account_id"] = String(mastodonAccountId)
                }
                if let mastodonStatusId = self.mastodonStatusId {
                    record["mastodon_status_id"] = String(mastodonStatusId)
                }
                if let recommendationId = self.recommendationId {
                    record["recommendation_id"] = String(recommendationId)
                }
                if let uiAdditionalDetail = self.uiAdditionalDetail {
                    record["ui_additional_detail"] = String(uiAdditionalDetail)
                }
                if let uiIdentifier = self.uiIdentifier {
                    record["ui_identifier"] = String(uiIdentifier)
                }
                if let url = self.url {
                    record["url"] = String(url)
                }

                return record
            }
        }

        /// Event triggered when a user taps/clicks on a UI element, triggering a change in
        /// app state.
        /// data_taxonomy:
        ///   data_categories: [user.behavior]
        ///   data_uses: [analytics.reporting, personalize.content]
        ///   data_subjects: [customer, visitor]
        ///   data_qualifier: [n/a]
        static let engagement = EventMetricType<EngagementExtra>( // generated from ui.engagement
            CommonMetricData(
                category: "ui",
                name: "engagement",
                sendInPings: ["events"],
                lifetime: .ping,
                disabled: false
            )
            , ["engagement_type", "engagement_value", "index", "mastodon_account_handle", "mastodon_account_id", "mastodon_status_id", "recommendation_id", "ui_additional_detail", "ui_identifier", "url"]
        )

        /// Event triggered when a user views a notable UI element. Triggered once per page
        /// load, as soon as any pixel of that UI element is visible in the foreground for
        /// any length of time. UI elements may include: content, pages, CTAs, etc.
        /// data_taxonomy:
        ///   data_categories: [user.behavior]
        ///   data_uses: [analytics.reporting, personalize.content]
        ///   data_subjects: [customer, visitor]
        ///   data_qualifier: [n/a]
        static let impression = EventMetricType<ImpressionExtra>( // generated from ui.impression
            CommonMetricData(
                category: "ui",
                name: "impression",
                sendInPings: ["events"],
                lifetime: .ping,
                disabled: false
            )
            , ["index", "mastodon_account_handle", "mastodon_account_id", "mastodon_status_id", "recommendation_id", "ui_additional_detail", "ui_identifier", "url"]
        )

    }

    enum Web {
        struct LinkClickExtra: EventExtras {
            var elementId: String?
            var targetUrl: String?

            func toExtraRecord() -> [String: String] {
                var record = [String: String]()

                if let elementId = self.elementId {
                    record["element_id"] = String(elementId)
                }
                if let targetUrl = self.targetUrl {
                    record["target_url"] = String(targetUrl)
                }

                return record
            }
        }

        /// Event triggered when a user clicks a link on a web page.
        /// data_taxonomy:
        ///   data_categories: [user.behavior]
        ///   data_uses: [analytics.reporting]
        ///   data_subjects: [customer, visitor]
        ///   data_qualifier: [n/a]
        static let linkClick = EventMetricType<LinkClickExtra>( // generated from web.link_click
            CommonMetricData(
                category: "web",
                name: "link_click",
                sendInPings: ["events"],
                lifetime: .ping,
                disabled: false
            )
            , ["element_id", "target_url"]
        )

        /// The full URL of the page that was visited, along with URL query parameters. For
        /// example, `https://mozilla.social/home?utm_source=test`.
        /// data_taxonomy:
        ///   data_categories: [user.behavior.browsing_history]
        ///   data_uses: [analytics.reporting]
        ///   data_subjects: [customer, visitor]
        ///   data_qualifier: [n/a]
        static let pageUrl = StringMetricType( // generated from web.page_url
            CommonMetricData(
                category: "web",
                name: "page_url",
                sendInPings: ["events"],
                lifetime: .application,
                disabled: false
            )
        )

        /// Event triggered when a user requests to load a web page.
        /// data_taxonomy:
        ///   data_categories: [user.behavior]
        ///   data_uses: [analytics.reporting]
        ///   data_subjects: [customer, visitor]
        ///   data_qualifier: [n/a]
        static let pageView = EventMetricType<NoExtras>( // generated from web.page_view
            CommonMetricData(
                category: "web",
                name: "page_view",
                sendInPings: ["events"],
                lifetime: .ping,
                disabled: false
            )
            , []
        )

        /// The full URL of the previous web page from which a link was followed in order
        /// to trigger the page view. Comes from the `referrer` field of the HTTP header.
        /// May not always be available. For example, `https://www.google.com`.
        /// data_taxonomy:
        ///   data_categories: []
        ///   data_uses: [analytics.reporting]
        ///   data_subjects: [customer, visitor]
        ///   data_qualifier: [n/a]
        static let referrerUrl = StringMetricType( // generated from web.referrer_url
            CommonMetricData(
                category: "web",
                name: "referrer_url",
                sendInPings: ["events"],
                lifetime: .application,
                disabled: false
            )
        )

    }

}
