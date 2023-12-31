// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  class UnfavoriteItemMutation: GraphQLMutation {
    static let operationName: String = "UnfavoriteItem"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation UnfavoriteItem($givenUrl: Url!, $timestamp: ISOString!) { savedItemUnFavorite(givenUrl: $givenUrl, timestamp: $timestamp) { __typename id } }"#
      ))

    public var givenUrl: Url
    public var timestamp: ISOString

    public init(
      givenUrl: Url,
      timestamp: ISOString
    ) {
      self.givenUrl = givenUrl
      self.timestamp = timestamp
    }

    public var __variables: Variables? { [
      "givenUrl": givenUrl,
      "timestamp": timestamp
    ] }

    struct Data: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("savedItemUnFavorite", SavedItemUnFavorite?.self, arguments: [
          "givenUrl": .variable("givenUrl"),
          "timestamp": .variable("timestamp")
        ]),
      ] }

      /// 'Unfavorite' a 'favorite' SavedItem (identified by URL)
      var savedItemUnFavorite: SavedItemUnFavorite? { __data["savedItemUnFavorite"] }

      /// SavedItemUnFavorite
      ///
      /// Parent Type: `SavedItem`
      struct SavedItemUnFavorite: PocketGraph.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SavedItem }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", PocketGraph.ID.self),
        ] }

        /// Surrogate primary key. This is usually generated by clients, but will be generated by the server if not passed through creation
        var id: PocketGraph.ID { __data["id"] }
      }
    }
  }

}