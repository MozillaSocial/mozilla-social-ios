// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  class HomeSlateLineupQuery: GraphQLQuery {
    static let operationName: String = "HomeSlateLineup"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query HomeSlateLineup($locale: String!) { homeSlateLineup(locale: $locale) { __typename id slates { __typename ...CorpusSlateParts } } }"#,
        fragments: [CorpusSlateParts.self, CorpusRecommendationParts.self, CorpusItemParts.self, SyndicatedArticleParts.self, CollectionSummary.self, CollectionAuthorSummary.self]
      ))

    public var locale: String

    public init(locale: String) {
      self.locale = locale
    }

    public var __variables: Variables? { ["locale": locale] }

    struct Data: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("homeSlateLineup", HomeSlateLineup.self, arguments: ["locale": .variable("locale")]),
      ] }

      /// Get ranked corpus slates and recommendations to deliver a unified Home experience. The locale argument determines the UI and recommendation content language.
      var homeSlateLineup: HomeSlateLineup { __data["homeSlateLineup"] }

      /// HomeSlateLineup
      ///
      /// Parent Type: `CorpusSlateLineup`
      struct HomeSlateLineup: PocketGraph.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CorpusSlateLineup }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", PocketGraph.ID.self),
          .field("slates", [Slate].self),
        ] }

        /// UUID
        var id: PocketGraph.ID { __data["id"] }
        /// Slates.
        var slates: [Slate] { __data["slates"] }

        /// HomeSlateLineup.Slate
        ///
        /// Parent Type: `CorpusSlate`
        struct Slate: PocketGraph.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CorpusSlate }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(CorpusSlateParts.self),
          ] }

          /// UUID
          var id: PocketGraph.ID { __data["id"] }
          /// The display headline for the slate. Surface context may be required to render determine what to display. This will depend on if we connect the copy to the Surface, SlateExperiment, or Slate.
          var headline: String { __data["headline"] }
          /// A smaller, secondary headline that can be displayed to provide additional context on the slate.
          var subheadline: String? { __data["subheadline"] }
          /// Recommendations for the current request context.
          var recommendations: [Recommendation] { __data["recommendations"] }

          struct Fragments: FragmentContainer {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            var corpusSlateParts: CorpusSlateParts { _toFragment() }
          }

          /// HomeSlateLineup.Slate.Recommendation
          ///
          /// Parent Type: `CorpusRecommendation`
          struct Recommendation: PocketGraph.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CorpusRecommendation }

            /// Clients should include this id in the `corpus_recommendation` Snowplow entity for impression, content_open, and engagement events related to this recommendation. This id is different across users, across requests, and across corpus items. The recommendation-api service associates metadata with this id to join and aggregate recommendations in our data warehouse.
            var id: PocketGraph.ID { __data["id"] }
            /// Content meta data.
            var corpusItem: CorpusItem { __data["corpusItem"] }

            struct Fragments: FragmentContainer {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              var corpusRecommendationParts: CorpusRecommendationParts { _toFragment() }
            }

            /// HomeSlateLineup.Slate.Recommendation.CorpusItem
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

              /// HomeSlateLineup.Slate.Recommendation.CorpusItem.Target
              ///
              /// Parent Type: `CorpusTarget`
              struct Target: PocketGraph.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: ApolloAPI.ParentType { PocketGraph.Unions.CorpusTarget }

                var asSyndicatedArticle: AsSyndicatedArticle? { _asInlineFragment() }
                var asCollection: AsCollection? { _asInlineFragment() }

                /// HomeSlateLineup.Slate.Recommendation.CorpusItem.Target.AsSyndicatedArticle
                ///
                /// Parent Type: `SyndicatedArticle`
                struct AsSyndicatedArticle: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  let __data: DataDict
                  init(_dataDict: DataDict) { __data = _dataDict }

                  typealias RootEntityType = HomeSlateLineupQuery.Data.HomeSlateLineup.Slate.Recommendation.CorpusItem.Target
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
                }

                /// HomeSlateLineup.Slate.Recommendation.CorpusItem.Target.AsCollection
                ///
                /// Parent Type: `Collection`
                struct AsCollection: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  let __data: DataDict
                  init(_dataDict: DataDict) { __data = _dataDict }

                  typealias RootEntityType = HomeSlateLineupQuery.Data.HomeSlateLineup.Slate.Recommendation.CorpusItem.Target
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

                  /// HomeSlateLineup.Slate.Recommendation.CorpusItem.Target.AsCollection.Author
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
                  }
                }
              }
            }
          }
        }
      }
    }
  }

}