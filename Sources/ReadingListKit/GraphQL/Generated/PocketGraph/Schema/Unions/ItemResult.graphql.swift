// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension PocketGraph.Unions {
  /// Union type for items that may or may not be processed
  static let ItemResult = Union(
    name: "ItemResult",
    possibleTypes: [
      PocketGraph.Objects.PendingItem.self,
      PocketGraph.Objects.Item.self
    ]
  )
}