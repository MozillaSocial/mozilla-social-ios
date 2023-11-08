// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct CorpusItemSummary: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment CorpusItemSummary on CorpusItem { __typename publisher }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CorpusItem }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("publisher", String.self),
    ] }

    /// The name of the online publication that published this story.
    var publisher: String { __data["publisher"] }

    init(
      publisher: String
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.CorpusItem.typename,
          "publisher": publisher,
        ],
        fulfilledFragments: [
          ObjectIdentifier(CorpusItemSummary.self)
        ]
      ))
    }
  }

}