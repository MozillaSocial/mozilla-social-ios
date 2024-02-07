// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import SwiftUI

public struct SegmentedControl: View {
    public let sources: [LocalizedStringKey]
    @Binding public var selected: LocalizedStringKey
    @Namespace private var namespace

    public init(sources: [LocalizedStringKey], selected: Binding<LocalizedStringKey>) {
        self.sources = sources
        _selected = selected
    }

    public var body: some View {
        HStack {
            ForEach(sources.indices) { segmentIndex in
                Button {
                    selected = sources[segmentIndex]
                } label: {
                    VStack {
                        Text(sources[segmentIndex])
                            .foregroundStyle(selected == sources[segmentIndex] ? Color.accentColor : .secondary)
                            .lineLimit(1)
                        ZStack {
                            Rectangle()
                                .fill(.clear)
                                .frame(height: 4)
                            if selected == sources[segmentIndex] {
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
    @State var selected: LocalizedStringKey = "One"
    var body: some View {
        SegmentedControl(sources: ["One", "Two", "Three"], selected: $selected)
            .accentColor(.green)

        Text("Selected Segment: ") + Text(selected)
    }
}

#Preview {
    SegmentedControlPreviewWrapper()
}
