// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension PocketGraph.Unions {
  /// TODO: Make this type implement PocketResource when available.
  /// https://getpocket.atlassian.net/wiki/spaces/PE/pages/2771714049/The+Future+of+Item
  static let CorpusTarget = Union(
    name: "CorpusTarget",
    possibleTypes: [
      PocketGraph.Objects.SyndicatedArticle.self,
      PocketGraph.Objects.Collection.self
    ]
  )
}