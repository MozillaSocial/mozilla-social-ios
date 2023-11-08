// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension PocketGraph {
  struct SearchSortInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      sortBy: GraphQLEnum<SearchItemsSortBy>,
      sortOrder: GraphQLNullable<GraphQLEnum<SearchItemsSortOrder>> = nil
    ) {
      __data = InputDict([
        "sortBy": sortBy,
        "sortOrder": sortOrder
      ])
    }

    /// The field by which to sort user items
    var sortBy: GraphQLEnum<SearchItemsSortBy> {
      get { __data["sortBy"] }
      set { __data["sortBy"] = newValue }
    }

    /// The order in which to sort user items
    var sortOrder: GraphQLNullable<GraphQLEnum<SearchItemsSortOrder>> {
      get { __data["sortOrder"] }
      set { __data["sortOrder"] = newValue }
    }
  }

}