// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension PocketGraph {
  /// Input field for upserting a SavedItem
  struct SavedItemUpsertInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      url: String,
      isFavorite: GraphQLNullable<Bool> = nil,
      timestamp: GraphQLNullable<Int> = nil,
      title: GraphQLNullable<String> = nil
    ) {
      __data = InputDict([
        "url": url,
        "isFavorite": isFavorite,
        "timestamp": timestamp,
        "title": title
      ])
    }

    /// The url to create/update the SavedItem with. (the url to save to the list)
    var url: String {
      get { __data["url"] }
      set { __data["url"] = newValue }
    }

    /// Optional, create/update the SavedItem as a favorited item
    var isFavorite: GraphQLNullable<Bool> {
      get { __data["isFavorite"] }
      set { __data["isFavorite"] = newValue }
    }

    /// Optional, time that request was submitted by client epoch/unix time
    var timestamp: GraphQLNullable<Int> {
      get { __data["timestamp"] }
      set { __data["timestamp"] = newValue }
    }

    /// Optional, title of the SavedItem
    var title: GraphQLNullable<String> {
      get { __data["title"] }
      set { __data["title"] = newValue }
    }
  }

}