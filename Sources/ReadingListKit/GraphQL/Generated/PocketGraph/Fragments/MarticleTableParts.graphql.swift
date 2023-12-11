// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct MarticleTableParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment MarticleTableParts on MarticleTable { __typename html }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleTable }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("html", String.self),
    ] }

    /// Raw HTML representation of the table.
    var html: String { __data["html"] }

    init(
      html: String
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.MarticleTable.typename,
          "html": html,
        ],
        fulfilledFragments: [
          ObjectIdentifier(MarticleTableParts.self)
        ]
      ))
    }
  }

}