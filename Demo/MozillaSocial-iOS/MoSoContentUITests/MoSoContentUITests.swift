// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import XCTest

final class MoSoContentUITests: XCTestCase {
    // swiftlint:disable overridden_super_call
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation
        // required for your tests before they run. The setUp method is a good place to do this.
    }
    // swiftlint:enable overridden_super_call

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

    func testAccessibilityAudits_withDarkMode() throws {
        if #available(iOS 17, *) {
            let app = XCUIApplication()
            XCUIDevice.shared.appearance = .dark
            app.launch()
            try app.performAccessibilityAudit { issue in
                guard issue.auditType == .textClipped || issue.auditType == .contrast else {
                    return false
                }

                return true
            }
        }
    }

    func testAccessibilityAudits_withLightMode() throws {
        if #available(iOS 17, *) {
            let app = XCUIApplication()
            XCUIDevice.shared.appearance = .light
            app.launch()
            try app.performAccessibilityAudit { issue in
                guard issue.auditType == .textClipped else {
                    return false
                }

                return true
            }
        }
    }
}
