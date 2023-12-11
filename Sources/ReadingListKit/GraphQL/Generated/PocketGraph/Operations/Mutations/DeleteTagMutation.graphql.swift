// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  class DeleteTagMutation: GraphQLMutation {
    static let operationName: String = "DeleteTag"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation DeleteTag($id: ID!) { deleteTag(id: $id) }"#
      ))

    public var id: ID

    public init(id: ID) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    struct Data: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("deleteTag", PocketGraph.ID.self, arguments: ["id": .variable("id")]),
      ] }

      /// Deletes a Tag object. This is deletes the Tag and all SavedItem associations
      /// (removes the Tag from all SavedItems). Returns ID of the deleted Tag.
      var deleteTag: PocketGraph.ID { __data["deleteTag"] }
    }
  }

}