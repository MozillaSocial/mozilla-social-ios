// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct PendingItemParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment PendingItemParts on PendingItem { __typename remoteID: itemId givenUrl: url status }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.PendingItem }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("itemId", alias: "remoteID", String.self),
      .field("url", alias: "givenUrl", PocketGraph.Url.self),
      .field("status", GraphQLEnum<PocketGraph.PendingItemStatus>?.self),
    ] }

    /// URL of the item that the user gave for the SavedItem
    /// that is pending processing by parser
    var remoteID: String { __data["remoteID"] }
    var givenUrl: PocketGraph.Url { __data["givenUrl"] }
    var status: GraphQLEnum<PocketGraph.PendingItemStatus>? { __data["status"] }

    init(
      remoteID: String,
      givenUrl: PocketGraph.Url,
      status: GraphQLEnum<PocketGraph.PendingItemStatus>? = nil
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.PendingItem.typename,
          "remoteID": remoteID,
          "givenUrl": givenUrl,
          "status": status,
        ],
        fulfilledFragments: [
          ObjectIdentifier(PendingItemParts.self)
        ]
      ))
    }
  }

}