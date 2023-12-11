// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension PocketGraph {
  /// Input field for updating a Tag
  struct TagUpdateInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      id: ID,
      name: String
    ) {
      __data = InputDict([
        "id": id,
        "name": name
      ])
    }

    /// Tag ID
    var id: ID {
      get { __data["id"] }
      set { __data["id"] = newValue }
    }

    /// The updated tag string
    var name: String {
      get { __data["name"] }
      set { __data["name"] = newValue }
    }
  }

}