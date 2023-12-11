// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct SyndicatedArticleParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment SyndicatedArticleParts on SyndicatedArticle { __typename itemId mainImage title excerpt publisher { __typename name } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SyndicatedArticle }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("itemId", PocketGraph.ID?.self),
      .field("mainImage", String?.self),
      .field("title", String.self),
      .field("excerpt", String?.self),
      .field("publisher", Publisher?.self),
    ] }

    /// The item id of this Syndicated Article
    var itemId: PocketGraph.ID? { __data["itemId"] }
    /// Primary image to use in surfacing this content
    var mainImage: String? { __data["mainImage"] }
    /// Title of syndicated article
    var title: String { __data["title"] }
    /// Excerpt 
    var excerpt: String? { __data["excerpt"] }
    /// The manually set publisher information for this article
    var publisher: Publisher? { __data["publisher"] }

    init(
      itemId: PocketGraph.ID? = nil,
      mainImage: String? = nil,
      title: String,
      excerpt: String? = nil,
      publisher: Publisher? = nil
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.SyndicatedArticle.typename,
          "itemId": itemId,
          "mainImage": mainImage,
          "title": title,
          "excerpt": excerpt,
          "publisher": publisher._fieldData,
        ],
        fulfilledFragments: [
          ObjectIdentifier(SyndicatedArticleParts.self)
        ]
      ))
    }

    /// Publisher
    ///
    /// Parent Type: `Publisher`
    struct Publisher: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Publisher }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String?.self),
      ] }

      /// Name of the publisher of the article
      var name: String? { __data["name"] }

      init(
        name: String? = nil
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": PocketGraph.Objects.Publisher.typename,
            "name": name,
          ],
          fulfilledFragments: [
            ObjectIdentifier(SyndicatedArticleParts.Publisher.self)
          ]
        ))
      }
    }
  }

}