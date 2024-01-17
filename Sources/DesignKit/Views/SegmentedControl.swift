// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

public struct SegmentedControl: View {
    public let sources: [String]
    @Binding public var selected: String
    @Namespace var namespace

    public var body: some View {
        HStack {
            ForEach(sources, id: \.self) { segment in
                Button {
                    selected = segment
                } label: {
                    VStack {
                        Text(segment)
                            .fontWeight(.heavy)
                            .foregroundStyle(selected == segment ? Color.accentColor : .secondary)
                        ZStack {
                            Rectangle()
                                .fill(.clear)
                                .frame(height: 4)
                            if selected == segment {
                                Rectangle()
                                    .fill(Color.accentColor)
                                    .frame(height: 4)
                                    .matchedGeometryEffect(id: "Segment", in: namespace)
                            }
                        }
                    }
                }
                .buttonStyle(.plain)
            }
        }
    }
}

private struct SegmentedControlPreviewWrapper: View {
    @State var selected = "One"
    var body: some View {
        SegmentedControl(sources: ["One", "Two", "Three"], selected: $selected)
            .accentColor(.green)
    }
}

#Preview {
    SegmentedControlPreviewWrapper()
}
