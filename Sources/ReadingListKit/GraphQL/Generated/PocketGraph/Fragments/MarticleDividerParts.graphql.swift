// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct MarticleDividerParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment MarticleDividerParts on MarticleDivider { __typename content }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleDivider }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("content", PocketGraph.Markdown.self),
    ] }

    /// Always '---'; provided for convenience if building a markdown string
    var content: PocketGraph.Markdown { __data["content"] }

    init(
      content: PocketGraph.Markdown
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.MarticleDivider.typename,
          "content": content,
        ],
        fulfilledFragments: [
          ObjectIdentifier(MarticleDividerParts.self)
        ]
      ))
    }
  }

}