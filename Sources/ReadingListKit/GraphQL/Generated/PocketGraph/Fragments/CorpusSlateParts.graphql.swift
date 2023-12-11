// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct CorpusSlateParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment CorpusSlateParts on CorpusSlate { __typename id headline subheadline recommendations { __typename ...CorpusRecommendationParts } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CorpusSlate }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", PocketGraph.ID.self),
      .field("headline", String.self),
      .field("subheadline", String?.self),
      .field("recommendations", [Recommendation].self),
    ] }

    /// UUID
    var id: PocketGraph.ID { __data["id"] }
    /// The display headline for the slate. Surface context may be required to render determine what to display. This will depend on if we connect the copy to the Surface, SlateExperiment, or Slate.
    var headline: String { __data["headline"] }
    /// A smaller, secondary headline that can be displayed to provide additional context on the slate.
    var subheadline: String? { __data["subheadline"] }
    /// Recommendations for the current request context.
    var recommendations: [Recommendation] { __data["recommendations"] }

    init(
      id: PocketGraph.ID,
      headline: String,
      subheadline: String? = nil,
      recommendations: [Recommendation]
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.CorpusSlate.typename,
          "id": id,
          "headline": headline,
          "subheadline": subheadline,
          "recommendations": recommendations._fieldData,
        ],
        fulfilledFragments: [
          ObjectIdentifier(CorpusSlateParts.self)
        ]
      ))
    }

    /// Recommendation
    ///
    /// Parent Type: `CorpusRecommendation`
    struct Recommendation: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CorpusRecommendation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(CorpusRecommendationParts.self),
      ] }

      /// Clients should include this id in the `corpus_recommendation` Snowplow entity for impression, content_open, and engagement events related to this recommendation. This id is different across users, across requests, and across corpus items. The recommendation-api service associates metadata with this id to join and aggregate recommendations in our data warehouse.
      var id: PocketGraph.ID { __data["id"] }
      /// Content meta data.
      var corpusItem: CorpusItem { __data["corpusItem"] }

      struct Fragments: FragmentContainer {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        var corpusRecommendationParts: CorpusRecommendationParts { _toFragment() }
      }

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
            ObjectIdentifier(CorpusSlateParts.Recommendation.self),
            ObjectIdentifier(CorpusRecommendationParts.self)
          ]
        ))
      }

      /// Recommendation.CorpusItem
      ///
      /// Parent Type: `CorpusItem`
      struct CorpusItem: PocketGraph.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CorpusItem }

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
              ObjectIdentifier(CorpusSlateParts.Recommendation.CorpusItem.self),
              ObjectIdentifier(CorpusItemParts.self),
              ObjectIdentifier(CorpusRecommendationParts.CorpusItem.self)
            ]
          ))
        }

        /// Recommendation.CorpusItem.Target
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
                ObjectIdentifier(CorpusSlateParts.Recommendation.CorpusItem.Target.self)
              ]
            ))
          }

          /// Recommendation.CorpusItem.Target.AsSyndicatedArticle
          ///
          /// Parent Type: `SyndicatedArticle`
          struct AsSyndicatedArticle: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            typealias RootEntityType = CorpusSlateParts.Recommendation.CorpusItem.Target
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
                  ObjectIdentifier(CorpusSlateParts.Recommendation.CorpusItem.Target.self),
                  ObjectIdentifier(CorpusSlateParts.Recommendation.CorpusItem.Target.AsSyndicatedArticle.self),
                  ObjectIdentifier(SyndicatedArticleParts.self),
                  ObjectIdentifier(CorpusItemParts.Target.self),
                  ObjectIdentifier(CorpusItemParts.Target.AsSyndicatedArticle.self)
                ]
              ))
            }
          }

          /// Recommendation.CorpusItem.Target.AsCollection
          ///
          /// Parent Type: `Collection`
          struct AsCollection: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            typealias RootEntityType = CorpusSlateParts.Recommendation.CorpusItem.Target
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
                  ObjectIdentifier(CorpusSlateParts.Recommendation.CorpusItem.Target.self),
                  ObjectIdentifier(CorpusSlateParts.Recommendation.CorpusItem.Target.AsCollection.self),
                  ObjectIdentifier(CollectionSummary.self),
                  ObjectIdentifier(CorpusItemParts.Target.self),
                  ObjectIdentifier(CorpusItemParts.Target.AsCollection.self)
                ]
              ))
            }

            /// Recommendation.CorpusItem.Target.AsCollection.Author
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
                    ObjectIdentifier(CorpusSlateParts.Recommendation.CorpusItem.Target.AsCollection.Author.self),
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

}