// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct MarticleHeadingParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment MarticleHeadingParts on MarticleHeading { __typename content level }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleHeading }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("content", PocketGraph.Markdown.self),
      .field("level", Int.self),
    ] }

    /// Heading text, in markdown.
    var content: PocketGraph.Markdown { __data["content"] }
    /// Heading level. Restricted to values 1-6.
    var level: Int { __data["level"] }

    init(
      content: PocketGraph.Markdown,
      level: Int
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.MarticleHeading.typename,
          "content": content,
          "level": level,
        ],
        fulfilledFragments: [
          ObjectIdentifier(MarticleHeadingParts.self)
        ]
      ))
    }
  }

}