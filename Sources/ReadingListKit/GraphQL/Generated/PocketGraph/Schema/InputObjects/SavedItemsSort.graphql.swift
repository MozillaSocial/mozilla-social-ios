// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension PocketGraph {
  /// Input to sort fetched SavedItems. If unspecified, defaults to CREATED_AT, ASC.
  struct SavedItemsSort: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      sortBy: GraphQLEnum<SavedItemsSortBy>,
      sortOrder: GraphQLEnum<SavedItemsSortOrder>
    ) {
      __data = InputDict([
        "sortBy": sortBy,
        "sortOrder": sortOrder
      ])
    }

    /// The field by which to sort SavedItems
    var sortBy: GraphQLEnum<SavedItemsSortBy> {
      get { __data["sortBy"] }
      set { __data["sortBy"] = newValue }
    }

    /// The order in which to sort SavedItems
    var sortOrder: GraphQLEnum<SavedItemsSortOrder> {
      get { __data["sortOrder"] }
      set { __data["sortOrder"] = newValue }
    }
  }

}