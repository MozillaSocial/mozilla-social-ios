// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

extension View {
    @ViewBuilder
    public func `if`<Content: View>(_ condition: Bool, modify: (Self) -> Content) -> some View {
        if condition {
            modify(self)
        } else {
            self
        }
    }

    public func toastView(config: Binding<ToastConfiguration?>) -> some View {
        self.modifier(ToastModifier(configuration: config))
      }
}
