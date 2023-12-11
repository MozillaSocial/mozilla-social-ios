// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension PocketGraph {
  /// Input field for filtering a user's list
  struct SavedItemsFilter: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      updatedSince: GraphQLNullable<Int> = nil,
      isFavorite: GraphQLNullable<Bool> = nil,
      isArchived: GraphQLNullable<Bool> = nil,
      tagIds: GraphQLNullable<[ID]> = nil,
      tagNames: GraphQLNullable<[String]> = nil,
      isHighlighted: GraphQLNullable<Bool> = nil,
      contentType: GraphQLNullable<GraphQLEnum<SavedItemsContentType>> = nil,
      status: GraphQLNullable<GraphQLEnum<SavedItemStatusFilter>> = nil,
      statuses: GraphQLNullable<[GraphQLEnum<SavedItemStatusFilter>?]> = nil
    ) {
      __data = InputDict([
        "updatedSince": updatedSince,
        "isFavorite": isFavorite,
        "isArchived": isArchived,
        "tagIds": tagIds,
        "tagNames": tagNames,
        "isHighlighted": isHighlighted,
        "contentType": contentType,
        "status": status,
        "statuses": statuses
      ])
    }

    /// Optional, filter to get SavedItems updated since a unix timestamp
    var updatedSince: GraphQLNullable<Int> {
      get { __data["updatedSince"] }
      set { __data["updatedSince"] = newValue }
    }

    /// Optional, filter to get SavedItems that have been favorited
    var isFavorite: GraphQLNullable<Bool> {
      get { __data["isFavorite"] }
      set { __data["isFavorite"] = newValue }
    }

    /// Optional, filter to get SavedItems that have been archived.
    /// This field is deprecated. Use status instead.
    /// TODO: Add deprecate tag once input field deprecation is enabled.
    /// Ref: https://github.com/apollographql/federation/issues/912
    var isArchived: GraphQLNullable<Bool> {
      get { __data["isArchived"] }
      set { __data["isArchived"] = newValue }
    }

    /// Optional, filter to get SavedItems associated to the specified Tag.
    var tagIds: GraphQLNullable<[ID]> {
      get { __data["tagIds"] }
      set { __data["tagIds"] = newValue }
    }

    /// Optional, filter to get SavedItems associated to the specified Tag name.
    /// To get untagged items, include the string '_untagged_'.
    var tagNames: GraphQLNullable<[String]> {
      get { __data["tagNames"] }
      set { __data["tagNames"] = newValue }
    }

    /// Optional, filter to get SavedItems with highlights
    var isHighlighted: GraphQLNullable<Bool> {
      get { __data["isHighlighted"] }
      set { __data["isHighlighted"] = newValue }
    }

    /// Optional, filter to get SavedItems based on content type
    var contentType: GraphQLNullable<GraphQLEnum<SavedItemsContentType>> {
      get { __data["contentType"] }
      set { __data["contentType"] = newValue }
    }

    /// Optional, filter to get user items based on status. Deprecated: use statuses instead.
    var status: GraphQLNullable<GraphQLEnum<SavedItemStatusFilter>> {
      get { __data["status"] }
      set { __data["status"] = newValue }
    }

    /// Optional, filters to get user items based on multiple statuses (OR operator)
    var statuses: GraphQLNullable<[GraphQLEnum<SavedItemStatusFilter>?]> {
      get { __data["statuses"] }
      set { __data["statuses"] = newValue }
    }
  }

}