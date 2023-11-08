// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct CollectionSummary: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment CollectionSummary on Collection { __typename slug authors { __typename ...CollectionAuthorSummary } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Collection }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("slug", String.self),
      .field("authors", [Author].self),
    ] }

    var slug: String { __data["slug"] }
    var authors: [Author] { __data["authors"] }

    init(
      slug: String,
      authors: [Author]
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.Collection.typename,
          "slug": slug,
          "authors": authors._fieldData,
        ],
        fulfilledFragments: [
          ObjectIdentifier(CollectionSummary.self)
        ]
      ))
    }

    /// Author
    ///
    /// Parent Type: `CollectionAuthor`
    struct Author: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CollectionAuthor }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(CollectionAuthorSummary.self),
      ] }

      var name: String { __data["name"] }

      struct Fragments: FragmentContainer {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        var collectionAuthorSummary: CollectionAuthorSummary { _toFragment() }
      }

      init(
        name: String
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": PocketGraph.Objects.CollectionAuthor.typename,
            "name": name,
          ],
          fulfilledFragments: [
            ObjectIdentifier(CollectionSummary.Author.self),
            ObjectIdentifier(CollectionAuthorSummary.self)
          ]
        ))
      }
    }
  }

}