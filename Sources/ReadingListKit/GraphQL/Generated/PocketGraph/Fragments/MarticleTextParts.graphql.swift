// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct MarticleTextParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment MarticleTextParts on MarticleText { __typename content }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleText }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("content", PocketGraph.Markdown.self),
    ] }

    /// Markdown text content. Typically, a paragraph.
    var content: PocketGraph.Markdown { __data["content"] }

    init(
      content: PocketGraph.Markdown
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.MarticleText.typename,
          "content": content,
        ],
        fulfilledFragments: [
          ObjectIdentifier(MarticleTextParts.self)
        ]
      ))
    }
  }

}