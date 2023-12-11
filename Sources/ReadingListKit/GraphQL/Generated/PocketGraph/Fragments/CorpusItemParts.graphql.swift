// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct CorpusItemParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment CorpusItemParts on CorpusItem { __typename id url title excerpt imageUrl publisher target { __typename ... on SyndicatedArticle { __typename ...SyndicatedArticleParts } ... on Collection { __typename ...CollectionSummary } } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CorpusItem }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", PocketGraph.ID.self),
      .field("url", PocketGraph.Url.self),
      .field("title", String.self),
      .field("excerpt", String.self),
      .field("imageUrl", PocketGraph.Url.self),
      .field("publisher", String.self),
      .field("target", Target?.self),
    ] }

    /// The GUID that is stored on an approved corpus item
    var id: PocketGraph.ID { __data["id"] }
    /// The URL of the Approved Item.
    var url: PocketGraph.Url { __data["url"] }
    /// The title of the Approved Item.
    var title: String { __data["title"] }
    /// The excerpt of the Approved Item.
    var excerpt: String { __data["excerpt"] }
    /// The image URL for this item's accompanying picture.
    var imageUrl: PocketGraph.Url { __data["imageUrl"] }
    /// The name of the online publication that published this story.
    var publisher: String { __data["publisher"] }
    /// If the Corpus Item is pocket owned with a specific type, this is the associated object (Collection or SyndicatedArticle).
    var target: Target? { __data["target"] }

    init(
      id: PocketGraph.ID,
      url: PocketGraph.Url,
      title: String,
      excerpt: String,
      imageUrl: PocketGraph.Url,
      publisher: String,
      target: Target? = nil
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.CorpusItem.typename,
          "id": id,
          "url": url,
          "title": title,
          "excerpt": excerpt,
          "imageUrl": imageUrl,
          "publisher": publisher,
          "target": target._fieldData,
        ],
        fulfilledFragments: [
          ObjectIdentifier(CorpusItemParts.self)
        ]
      ))
    }

    /// Target
    ///
    /// Parent Type: `CorpusTarget`
    struct Target: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Unions.CorpusTarget }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .inlineFragment(AsSyndicatedArticle.self),
        .inlineFragment(AsCollection.self),
      ] }

      var asSyndicatedArticle: AsSyndicatedArticle? { _asInlineFragment() }
      var asCollection: AsCollection? { _asInlineFragment() }

      init(
        __typename: String
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": __typename,
          ],
          fulfilledFragments: [
            ObjectIdentifier(CorpusItemParts.Target.self)
          ]
        ))
      }

      /// Target.AsSyndicatedArticle
      ///
      /// Parent Type: `SyndicatedArticle`
      struct AsSyndicatedArticle: PocketGraph.InlineFragment {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        typealias RootEntityType = CorpusItemParts.Target
        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SyndicatedArticle }
        static var __selections: [ApolloAPI.Selection] { [
          .fragment(SyndicatedArticleParts.self),
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
        var publisher: SyndicatedArticleParts.Publisher? { __data["publisher"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var syndicatedArticleParts: SyndicatedArticleParts { _toFragment() }
        }

        init(
          itemId: PocketGraph.ID? = nil,
          mainImage: String? = nil,
          title: String,
          excerpt: String? = nil,
          publisher: SyndicatedArticleParts.Publisher? = nil
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
              ObjectIdentifier(CorpusItemParts.Target.self),
              ObjectIdentifier(CorpusItemParts.Target.AsSyndicatedArticle.self),
              ObjectIdentifier(SyndicatedArticleParts.self)
            ]
          ))
        }
      }

      /// Target.AsCollection
      ///
      /// Parent Type: `Collection`
      struct AsCollection: PocketGraph.InlineFragment {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        typealias RootEntityType = CorpusItemParts.Target
        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Collection }
        static var __selections: [ApolloAPI.Selection] { [
          .fragment(CollectionSummary.self),
        ] }

        var slug: String { __data["slug"] }
        var authors: [Author] { __data["authors"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var collectionSummary: CollectionSummary { _toFragment() }
        }

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
              ObjectIdentifier(CorpusItemParts.Target.self),
              ObjectIdentifier(CorpusItemParts.Target.AsCollection.self),
              ObjectIdentifier(CollectionSummary.self)
            ]
          ))
        }

        /// Target.AsCollection.Author
        ///
        /// Parent Type: `CollectionAuthor`
        struct Author: PocketGraph.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CollectionAuthor }

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
                ObjectIdentifier(CorpusItemParts.Target.AsCollection.Author.self),
                ObjectIdentifier(CollectionAuthorSummary.self),
                ObjectIdentifier(CollectionSummary.Author.self)
              ]
            ))
          }
        }
      }
    }
  }

}