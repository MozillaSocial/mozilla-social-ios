// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct MarticleBlockquoteParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment MarticleBlockquoteParts on MarticleBlockquote { __typename content }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleBlockquote }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("content", PocketGraph.Markdown.self),
    ] }

    /// Markdown text content.
    var content: PocketGraph.Markdown { __data["content"] }

    init(
      content: PocketGraph.Markdown
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.MarticleBlockquote.typename,
          "content": content,
        ],
        fulfilledFragments: [
          ObjectIdentifier(MarticleBlockquoteParts.self)
        ]
      ))
    }
  }

}