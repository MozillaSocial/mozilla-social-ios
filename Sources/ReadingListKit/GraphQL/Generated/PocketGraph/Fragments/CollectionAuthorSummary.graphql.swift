// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct CollectionAuthorSummary: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment CollectionAuthorSummary on CollectionAuthor { __typename name }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CollectionAuthor }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("name", String.self),
    ] }

    var name: String { __data["name"] }

    init(
      name: String
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.CollectionAuthor.typename,
          "name": name,
        ],
        fulfilledFragments: [
          ObjectIdentifier(CollectionAuthorSummary.self)
        ]
      ))
    }
  }

}