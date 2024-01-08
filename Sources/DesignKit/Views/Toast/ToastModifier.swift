// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

struct ToastModifier: ViewModifier {
  @Binding var configuration: ToastConfiguration?
  @State private var workItem: DispatchWorkItem?

  func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .overlay(
        ZStack {
          mainToastView()
            .offset(y: 32)
        }.animation(.spring(), value: configuration)
      )
      .onChange(of: configuration) { value in
        showToast()
      }
  }

    @ViewBuilder
    func mainToastView() -> some View {
    if let config = configuration {
      VStack {
        Toast(
          style: config.style,
          message: config.message,
          width: config.width
        ) {
          dismissToast()
        }
        Spacer()
      }
    }
  }

  private func showToast() {
    guard let toast = configuration else { return }

    UIImpactFeedbackGenerator(style: .light)
      .impactOccurred()

    if toast.duration > 0 {
      workItem?.cancel()

      let task = DispatchWorkItem {
        dismissToast()
      }

      workItem = task
      DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
    }
  }

  private func dismissToast() {
    withAnimation {
      configuration = nil
    }

    workItem?.cancel()
    workItem = nil
  }
}
