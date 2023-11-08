// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct CorpusRecommendationParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment CorpusRecommendationParts on CorpusRecommendation { __typename id corpusItem { __typename ...CorpusItemParts } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CorpusRecommendation }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", PocketGraph.ID.self),
      .field("corpusItem", CorpusItem.self),
    ] }

    /// Clients should include this id in the `corpus_recommendation` Snowplow entity for impression, content_open, and engagement events related to this recommendation. This id is different across users, across requests, and across corpus items. The recommendation-api service associates metadata with this id to join and aggregate recommendations in our data warehouse.
    var id: PocketGraph.ID { __data["id"] }
    /// Content meta data.
    var corpusItem: CorpusItem { __data["corpusItem"] }

    init(
      id: PocketGraph.ID,
      corpusItem: CorpusItem
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.CorpusRecommendation.typename,
          "id": id,
          "corpusItem": corpusItem._fieldData,
        ],
        fulfilledFragments: [
          ObjectIdentifier(CorpusRecommendationParts.self)
        ]
      ))
    }

    /// CorpusItem
    ///
    /// Parent Type: `CorpusItem`
    struct CorpusItem: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CorpusItem }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(CorpusItemParts.self),
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

      struct Fragments: FragmentContainer {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        var corpusItemParts: CorpusItemParts { _toFragment() }
      }

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
            ObjectIdentifier(CorpusRecommendationParts.CorpusItem.self),
            ObjectIdentifier(CorpusItemParts.self)
          ]
        ))
      }

      /// CorpusItem.Target
      ///
      /// Parent Type: `CorpusTarget`
      struct Target: PocketGraph.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { PocketGraph.Unions.CorpusTarget }

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
              ObjectIdentifier(CorpusRecommendationParts.CorpusItem.Target.self)
            ]
          ))
        }

        /// CorpusItem.Target.AsSyndicatedArticle
        ///
        /// Parent Type: `SyndicatedArticle`
        struct AsSyndicatedArticle: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          typealias RootEntityType = CorpusRecommendationParts.CorpusItem.Target
          static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SyndicatedArticle }
          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
            SyndicatedArticleParts.self,
            CorpusItemParts.Target.AsSyndicatedArticle.self
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
                ObjectIdentifier(CorpusRecommendationParts.CorpusItem.Target.self),
                ObjectIdentifier(CorpusRecommendationParts.CorpusItem.Target.AsSyndicatedArticle.self),
                ObjectIdentifier(SyndicatedArticleParts.self),
                ObjectIdentifier(CorpusItemParts.Target.self),
                ObjectIdentifier(CorpusItemParts.Target.AsSyndicatedArticle.self)
              ]
            ))
          }
        }

        /// CorpusItem.Target.AsCollection
        ///
        /// Parent Type: `Collection`
        struct AsCollection: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          typealias RootEntityType = CorpusRecommendationParts.CorpusItem.Target
          static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Collection }
          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
            CollectionSummary.self,
            CorpusItemParts.Target.AsCollection.self
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
                ObjectIdentifier(CorpusRecommendationParts.CorpusItem.Target.self),
                ObjectIdentifier(CorpusRecommendationParts.CorpusItem.Target.AsCollection.self),
                ObjectIdentifier(CollectionSummary.self),
                ObjectIdentifier(CorpusItemParts.Target.self),
                ObjectIdentifier(CorpusItemParts.Target.AsCollection.self)
              ]
            ))
          }

          /// CorpusItem.Target.AsCollection.Author
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
                  ObjectIdentifier(CorpusRecommendationParts.CorpusItem.Target.AsCollection.Author.self),
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

}