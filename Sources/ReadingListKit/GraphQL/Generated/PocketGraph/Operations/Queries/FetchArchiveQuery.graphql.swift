// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  class FetchArchiveQuery: GraphQLQuery {
    static let operationName: String = "FetchArchive"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query FetchArchive($pagination: PaginationInput, $filter: SavedItemsFilter, $sort: SavedItemsSort) { user { __typename savedItems(pagination: $pagination, filter: $filter, sort: $sort) { __typename totalCount pageInfo { __typename hasNextPage endCursor } edges { __typename cursor node { __typename ...SavedItemSummary } } } } }"#,
        fragments: [SavedItemSummary.self, TagParts.self, ItemSummary.self, DomainMetadataParts.self, SyndicatedArticleParts.self, PendingItemParts.self, CorpusItemParts.self, CollectionSummary.self, CollectionAuthorSummary.self]
      ))

    public var pagination: GraphQLNullable<PaginationInput>
    public var filter: GraphQLNullable<SavedItemsFilter>
    public var sort: GraphQLNullable<SavedItemsSort>

    public init(
      pagination: GraphQLNullable<PaginationInput>,
      filter: GraphQLNullable<SavedItemsFilter>,
      sort: GraphQLNullable<SavedItemsSort>
    ) {
      self.pagination = pagination
      self.filter = filter
      self.sort = sort
    }

    public var __variables: Variables? { [
      "pagination": pagination,
      "filter": filter,
      "sort": sort
    ] }

    struct Data: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("user", User?.self),
      ] }

      /// Get a user entity for an authenticated client
      var user: User? { __data["user"] }

      /// User
      ///
      /// Parent Type: `User`
      struct User: PocketGraph.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("savedItems", SavedItems?.self, arguments: [
            "pagination": .variable("pagination"),
            "filter": .variable("filter"),
            "sort": .variable("sort")
          ]),
        ] }

        /// Get a general paginated listing of all SavedItems for the user
        var savedItems: SavedItems? { __data["savedItems"] }

        /// User.SavedItems
        ///
        /// Parent Type: `SavedItemConnection`
        struct SavedItems: PocketGraph.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SavedItemConnection }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("totalCount", Int.self),
            .field("pageInfo", PageInfo.self),
            .field("edges", [Edge?]?.self),
          ] }

          /// Identifies the total count of SavedItems in the connection.
          var totalCount: Int { __data["totalCount"] }
          /// Information to aid in pagination.
          var pageInfo: PageInfo { __data["pageInfo"] }
          /// A list of edges.
          var edges: [Edge?]? { __data["edges"] }

          /// User.SavedItems.PageInfo
          ///
          /// Parent Type: `PageInfo`
          struct PageInfo: PocketGraph.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.PageInfo }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("hasNextPage", Bool.self),
              .field("endCursor", String?.self),
            ] }

            /// When paginating forwards, are there more items?
            var hasNextPage: Bool { __data["hasNextPage"] }
            /// When paginating forwards, the cursor to continue.
            var endCursor: String? { __data["endCursor"] }
          }

          /// User.SavedItems.Edge
          ///
          /// Parent Type: `SavedItemEdge`
          struct Edge: PocketGraph.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SavedItemEdge }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("cursor", String.self),
              .field("node", Node?.self),
            ] }

            /// A cursor for use in pagination.
            var cursor: String { __data["cursor"] }
            /// The SavedItem at the end of the edge.
            var node: Node? { __data["node"] }

            /// User.SavedItems.Edge.Node
            ///
            /// Parent Type: `SavedItem`
            struct Node: PocketGraph.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SavedItem }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .fragment(SavedItemSummary.self),
              ] }

              /// The url the user saved to their list
              var url: String { __data["url"] }
              /// Surrogate primary key. This is usually generated by clients, but will be generated by the server if not passed through creation
              var remoteID: PocketGraph.ID { __data["remoteID"] }
              /// Helper property to indicate if the SavedItem is archived
              var isArchived: Bool { __data["isArchived"] }
              /// Helper property to indicate if the SavedItem is favorited
              var isFavorite: Bool { __data["isFavorite"] }
              /// Unix timestamp of when the entity was deleted, 30 days after this date this entity will be HARD deleted from the database and no longer exist
              var _deletedAt: Int? { __data["_deletedAt"] }
              /// Unix timestamp of when the entity was created
              var _createdAt: Int { __data["_createdAt"] }
              /// Timestamp that the SavedItem became archied, null if not archived
              var archivedAt: Int? { __data["archivedAt"] }
              /// The Tags associated with this SavedItem
              var tags: [Tag]? { __data["tags"] }
              /// Link to the underlying Pocket Item for the URL
              var item: Item { __data["item"] }
              /// If the item is in corpus allow the saved item to reference it.  Exposing curated info for consistent UX
              var corpusItem: CorpusItem? { __data["corpusItem"] }

              struct Fragments: FragmentContainer {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                var savedItemSummary: SavedItemSummary { _toFragment() }
              }

              /// User.SavedItems.Edge.Node.Tag
              ///
              /// Parent Type: `Tag`
              struct Tag: PocketGraph.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Tag }

                /// The actual tag string the user created for their list
                var name: String { __data["name"] }
                /// Surrogate primary key. This is usually generated by clients, but will be generated by the server if not passed through creation
                var id: PocketGraph.ID { __data["id"] }

                struct Fragments: FragmentContainer {
                  let __data: DataDict
                  init(_dataDict: DataDict) { __data = _dataDict }

                  var tagParts: TagParts { _toFragment() }
                }
              }

              /// User.SavedItems.Edge.Node.Item
              ///
              /// Parent Type: `ItemResult`
              struct Item: PocketGraph.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: ApolloAPI.ParentType { PocketGraph.Unions.ItemResult }

                var asItem: AsItem? { _asInlineFragment() }
                var asPendingItem: AsPendingItem? { _asInlineFragment() }

                /// User.SavedItems.Edge.Node.Item.AsItem
                ///
                /// Parent Type: `Item`
                struct AsItem: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  let __data: DataDict
                  init(_dataDict: DataDict) { __data = _dataDict }

                  typealias RootEntityType = FetchArchiveQuery.Data.User.SavedItems.Edge.Node.Item
                  static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Item }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    ItemSummary.self,
                    SavedItemSummary.Item.AsItem.self
                  ] }

                  /// The Item entity is owned by the Parser service.
                  /// We only extend it in this service to make this service's schema valid.
                  /// The key for this entity is the 'itemId'
                  var remoteID: String { __data["remoteID"] }
                  /// key field to identify the Item entity in the Parser service
                  var givenUrl: PocketGraph.Url { __data["givenUrl"] }
                  /// If the givenUrl redirects (once or many times), this is the final url. Otherwise, same as givenUrl
                  var resolvedUrl: PocketGraph.Url? { __data["resolvedUrl"] }
                  /// The title as determined by the parser.
                  var title: String? { __data["title"] }
                  /// The detected language of the article
                  var language: String? { __data["language"] }
                  /// The page's / publisher's preferred thumbnail image
                  @available(*, deprecated, message: "use the topImage object")
                  var topImageUrl: PocketGraph.Url? { __data["topImageUrl"] }
                  /// How long it will take to read the article (TODO in what time unit? and by what calculation?)
                  var timeToRead: Int? { __data["timeToRead"] }
                  /// The domain, such as 'getpocket.com' of the resolved_url
                  var domain: String? { __data["domain"] }
                  /// The date the article was published
                  var datePublished: PocketGraph.DateString? { __data["datePublished"] }
                  /// true if the item is an article
                  var isArticle: Bool? { __data["isArticle"] }
                  /// 0=no images, 1=contains images, 2=is an image
                  var hasImage: GraphQLEnum<PocketGraph.Imageness>? { __data["hasImage"] }
                  /// 0=no videos, 1=contains video, 2=is a video
                  var hasVideo: GraphQLEnum<PocketGraph.Videoness>? { __data["hasVideo"] }
                  /// Number of words in the article
                  var wordCount: Int? { __data["wordCount"] }
                  /// List of Authors involved with this article
                  var authors: [ItemSummary.Author?]? { __data["authors"] }
                  /// A snippet of text from the article
                  var excerpt: String? { __data["excerpt"] }
                  /// Additional information about the item domain, when present, use this for displaying the domain name
                  var domainMetadata: DomainMetadata? { __data["domainMetadata"] }
                  /// Array of images within an article
                  var images: [ItemSummary.Image?]? { __data["images"] }
                  /// If the item has a syndicated counterpart the syndication information
                  var syndicatedArticle: SyndicatedArticle? { __data["syndicatedArticle"] }

                  struct Fragments: FragmentContainer {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    var itemSummary: ItemSummary { _toFragment() }
                  }

                  /// User.SavedItems.Edge.Node.Item.AsItem.DomainMetadata
                  ///
                  /// Parent Type: `DomainMetadata`
                  struct DomainMetadata: PocketGraph.SelectionSet {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.DomainMetadata }

                    /// The name of the domain (e.g., The New York Times)
                    var name: String? { __data["name"] }
                    /// Url for the logo image
                    var logo: PocketGraph.Url? { __data["logo"] }

                    struct Fragments: FragmentContainer {
                      let __data: DataDict
                      init(_dataDict: DataDict) { __data = _dataDict }

                      var domainMetadataParts: DomainMetadataParts { _toFragment() }
                    }
                  }

                  /// User.SavedItems.Edge.Node.Item.AsItem.SyndicatedArticle
                  ///
                  /// Parent Type: `SyndicatedArticle`
                  struct SyndicatedArticle: PocketGraph.SelectionSet {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SyndicatedArticle }

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
                }

                /// User.SavedItems.Edge.Node.Item.AsPendingItem
                ///
                /// Parent Type: `PendingItem`
                struct AsPendingItem: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                  let __data: DataDict
                  init(_dataDict: DataDict) { __data = _dataDict }

                  typealias RootEntityType = FetchArchiveQuery.Data.User.SavedItems.Edge.Node.Item
                  static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.PendingItem }
                  public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                    PendingItemParts.self,
                    SavedItemSummary.Item.AsPendingItem.self
                  ] }

                  /// URL of the item that the user gave for the SavedItem
                  /// that is pending processing by parser
                  var remoteID: String { __data["remoteID"] }
                  var givenUrl: PocketGraph.Url { __data["givenUrl"] }
                  var status: GraphQLEnum<PocketGraph.PendingItemStatus>? { __data["status"] }

                  struct Fragments: FragmentContainer {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    var pendingItemParts: PendingItemParts { _toFragment() }
                  }
                }
              }

              /// User.SavedItems.Edge.Node.CorpusItem
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

                /// User.SavedItems.Edge.Node.CorpusItem.Target
                ///
                /// Parent Type: `CorpusTarget`
                struct Target: PocketGraph.SelectionSet {
                  let __data: DataDict
                  init(_dataDict: DataDict) { __data = _dataDict }

                  static var __parentType: ApolloAPI.ParentType { PocketGraph.Unions.CorpusTarget }

                  var asSyndicatedArticle: AsSyndicatedArticle? { _asInlineFragment() }
                  var asCollection: AsCollection? { _asInlineFragment() }

                  /// User.SavedItems.Edge.Node.CorpusItem.Target.AsSyndicatedArticle
                  ///
                  /// Parent Type: `SyndicatedArticle`
                  struct AsSyndicatedArticle: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    typealias RootEntityType = FetchArchiveQuery.Data.User.SavedItems.Edge.Node.CorpusItem.Target
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

                  /// User.SavedItems.Edge.Node.CorpusItem.Target.AsCollection
                  ///
                  /// Parent Type: `Collection`
                  struct AsCollection: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    typealias RootEntityType = FetchArchiveQuery.Data.User.SavedItems.Edge.Node.CorpusItem.Target
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

                    /// User.SavedItems.Edge.Node.CorpusItem.Target.AsCollection.Author
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

}