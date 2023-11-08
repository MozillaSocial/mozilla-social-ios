// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct MarticleBulletedListParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment MarticleBulletedListParts on MarticleBulletedList { __typename rows { __typename content level } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleBulletedList }
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
          "__typename": PocketGraph.Objects.MarticleBulletedList.typename,
          "rows": rows._fieldData,
        ],
        fulfilledFragments: [
          ObjectIdentifier(MarticleBulletedListParts.self)
        ]
      ))
    }

    /// Row
    ///
    /// Parent Type: `BulletedListElement`
    struct Row: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.BulletedListElement }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("content", PocketGraph.Markdown.self),
        .field("level", Int.self),
      ] }

      /// Row in a list.
      var content: PocketGraph.Markdown { __data["content"] }
      /// Zero-indexed level, for handling nested lists.
      var level: Int { __data["level"] }

      init(
        content: PocketGraph.Markdown,
        level: Int
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": PocketGraph.Objects.BulletedListElement.typename,
            "content": content,
            "level": level,
          ],
          fulfilledFragments: [
            ObjectIdentifier(MarticleBulletedListParts.Row.self)
          ]
        ))
      }
    }
  }

}