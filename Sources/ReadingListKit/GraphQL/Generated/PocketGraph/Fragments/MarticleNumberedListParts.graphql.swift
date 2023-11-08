// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct MarticleNumberedListParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment MarticleNumberedListParts on MarticleNumberedList { __typename rows { __typename content level index } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleNumberedList }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("rows", [Row].self),
    ] }

    var rows: [Row] { __data["rows"] }

    init(
      rows: [Row]
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.MarticleNumberedList.typename,
          "rows": rows._fieldData,
        ],
        fulfilledFragments: [
          ObjectIdentifier(MarticleNumberedListParts.self)
        ]
      ))
    }

    /// Row
    ///
    /// Parent Type: `NumberedListElement`
    struct Row: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.NumberedListElement }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("content", PocketGraph.Markdown.self),
        .field("level", Int.self),
        .field("index", Int.self),
      ] }

      /// Row in a list
      var content: PocketGraph.Markdown { __data["content"] }
      /// Zero-indexed level, for handling nested lists.
      var level: Int { __data["level"] }
      /// Numeric index. If a nested item, the index is zero-indexed from the first child.
      var index: Int { __data["index"] }

      init(
        content: PocketGraph.Markdown,
        level: Int,
        index: Int
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": PocketGraph.Objects.NumberedListElement.typename,
            "content": content,
            "level": level,
            "index": index,
          ],
          fulfilledFragments: [
            ObjectIdentifier(MarticleNumberedListParts.Row.self)
          ]
        ))
      }
    }
  }

}