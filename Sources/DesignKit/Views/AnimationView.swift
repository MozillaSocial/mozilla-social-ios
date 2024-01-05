// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI
import Lottie

public struct AnimationView: View {
    let animation: LottieAnimation

    public init(_ animation: PocketAnimation) {
        self.animation = LottieAnimation.named(animation.rawValue, bundle: .module, subdirectory: "Lottie")!
    }

    public var body: some View {
        LottieView(animation: animation)
            .playing(loopMode: .loop)
    }
}

public enum PocketAnimation: String, CaseIterable {
    case loading = "loading"
    case endOfFeed = "end-of-feed"
}

#Preview {
    List {
        ForEach(PocketAnimation.allCases, id: \.rawValue) { animation in
            HStack {
                Text(animation.rawValue)
                Spacer()
                AnimationView(animation)
                Spacer()
            }
        }
    }
}
