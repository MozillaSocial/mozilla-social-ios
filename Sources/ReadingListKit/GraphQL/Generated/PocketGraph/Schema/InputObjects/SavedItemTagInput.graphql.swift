// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension PocketGraph {
  /// Input field for adding Tag Associations to a SavedItem, by givenUrl
  struct SavedItemTagInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      givenUrl: Url,
      tagNames: [String]
    ) {
      __data = InputDict([
        "givenUrl": givenUrl,
        "tagNames": tagNames
      ])
    }

    var givenUrl: Url {
      get { __data["givenUrl"] }
      set { __data["givenUrl"] = newValue }
    }

    var tagNames: [String] {
      get { __data["tagNames"] }
      set { __data["tagNames"] = newValue }
    }
  }

}