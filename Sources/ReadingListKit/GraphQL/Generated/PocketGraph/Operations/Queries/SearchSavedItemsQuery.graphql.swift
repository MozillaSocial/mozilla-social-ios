// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  class SearchSavedItemsQuery: GraphQLQuery {
    static let operationName: String = "SearchSavedItems"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query SearchSavedItems($term: String!, $pagination: PaginationInput, $filter: SearchFilterInput, $sort: SearchSortInput) { user { __typename searchSavedItems( term: $term pagination: $pagination filter: $filter sort: $sort ) { __typename edges { __typename node { __typename savedItem { __typename ...SavedItemParts } } cursor } pageInfo { __typename endCursor hasNextPage hasPreviousPage startCursor } totalCount } } }"#,
        fragments: [SavedItemParts.self, TagParts.self, ItemParts.self, MarticleTextParts.self, ImageParts.self, MarticleDividerParts.self, MarticleTableParts.self, MarticleHeadingParts.self, MarticleCodeBlockParts.self, VideoParts.self, MarticleBulletedListParts.self, MarticleNumberedListParts.self, MarticleBlockquoteParts.self, DomainMetadataParts.self, SyndicatedArticleParts.self, PendingItemParts.self, CorpusItemSummary.self]
      ))

    public var term: String
    public var pagination: GraphQLNullable<PaginationInput>
    public var filter: GraphQLNullable<SearchFilterInput>
    public var sort: GraphQLNullable<SearchSortInput>

    public init(
      term: String,
      pagination: GraphQLNullable<PaginationInput>,
      filter: GraphQLNullable<SearchFilterInput>,
      sort: GraphQLNullable<SearchSortInput>
    ) {
      self.term = term
      self.pagination = pagination
      self.filter = filter
      self.sort = sort
    }

    public var __variables: Variables? { [
      "term": term,
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
          .field("searchSavedItems", SearchSavedItems?.self, arguments: [
            "term": .variable("term"),
            "pagination": .variable("pagination"),
            "filter": .variable("filter"),
            "sort": .variable("sort")
          ]),
        ] }

        /// Get a paginated list of user items that match a given term
        var searchSavedItems: SearchSavedItems? { __data["searchSavedItems"] }

        /// User.SearchSavedItems
        ///
        /// Parent Type: `SavedItemSearchResultConnection`
        struct SearchSavedItems: PocketGraph.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SavedItemSearchResultConnection }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("edges", [Edge].self),
            .field("pageInfo", PageInfo.self),
            .field("totalCount", Int.self),
          ] }

          /// A list of edges.
          var edges: [Edge] { __data["edges"] }
          /// Information to aid in pagination.
          var pageInfo: PageInfo { __data["pageInfo"] }
          /// Identifies the total count of items in the connection.
          var totalCount: Int { __data["totalCount"] }

          /// User.SearchSavedItems.Edge
          ///
          /// Parent Type: `SavedItemSearchResultEdge`
          struct Edge: PocketGraph.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SavedItemSearchResultEdge }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("node", Node.self),
              .field("cursor", String.self),
            ] }

            /// The item at the end of the edge.
            var node: Node { __data["node"] }
            /// A cursor for use in pagination.
            var cursor: String { __data["cursor"] }

            /// User.SearchSavedItems.Edge.Node
            ///
            /// Parent Type: `SavedItemSearchResult`
            struct Node: PocketGraph.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SavedItemSearchResult }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("savedItem", SavedItem.self),
              ] }

              var savedItem: SavedItem { __data["savedItem"] }

              /// User.SearchSavedItems.Edge.Node.SavedItem
              ///
              /// Parent Type: `SavedItem`
              struct SavedItem: PocketGraph.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SavedItem }
                static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .fragment(SavedItemParts.self),
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

                  var savedItemParts: SavedItemParts { _toFragment() }
                }

                /// User.SearchSavedItems.Edge.Node.SavedItem.Tag
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

                /// User.SearchSavedItems.Edge.Node.SavedItem.Item
                ///
                /// Parent Type: `ItemResult`
                struct Item: PocketGraph.SelectionSet {
                  let __data: DataDict
                  init(_dataDict: DataDict) { __data = _dataDict }

                  static var __parentType: ApolloAPI.ParentType { PocketGraph.Unions.ItemResult }

                  var asItem: AsItem? { _asInlineFragment() }
                  var asPendingItem: AsPendingItem? { _asInlineFragment() }

                  /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem
                  ///
                  /// Parent Type: `Item`
                  struct AsItem: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    typealias RootEntityType = SearchSavedItemsQuery.Data.User.SearchSavedItems.Edge.Node.SavedItem.Item
                    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Item }
                    public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                      ItemParts.self,
                      SavedItemParts.Item.AsItem.self
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
                    var authors: [ItemParts.Author?]? { __data["authors"] }
                    /// If the item is a collection allow them to get the collection information
                    var collection: ItemParts.Collection? { __data["collection"] }
                    /// The Marticle format of the article, used by clients for native article view.
                    var marticle: [Marticle]? { __data["marticle"] }
                    /// A snippet of text from the article
                    var excerpt: String? { __data["excerpt"] }
                    /// Additional information about the item domain, when present, use this for displaying the domain name
                    var domainMetadata: DomainMetadata? { __data["domainMetadata"] }
                    /// Array of images within an article
                    var images: [ItemParts.Image?]? { __data["images"] }
                    /// If the item has a syndicated counterpart the syndication information
                    var syndicatedArticle: SyndicatedArticle? { __data["syndicatedArticle"] }

                    struct Fragments: FragmentContainer {
                      let __data: DataDict
                      init(_dataDict: DataDict) { __data = _dataDict }

                      var itemParts: ItemParts { _toFragment() }
                    }

                    /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle
                    ///
                    /// Parent Type: `MarticleComponent`
                    struct Marticle: PocketGraph.SelectionSet {
                      let __data: DataDict
                      init(_dataDict: DataDict) { __data = _dataDict }

                      static var __parentType: ApolloAPI.ParentType { PocketGraph.Unions.MarticleComponent }

                      var asMarticleText: AsMarticleText? { _asInlineFragment() }
                      var asImage: AsImage? { _asInlineFragment() }
                      var asMarticleDivider: AsMarticleDivider? { _asInlineFragment() }
                      var asMarticleTable: AsMarticleTable? { _asInlineFragment() }
                      var asMarticleHeading: AsMarticleHeading? { _asInlineFragment() }
                      var asMarticleCodeBlock: AsMarticleCodeBlock? { _asInlineFragment() }
                      var asVideo: AsVideo? { _asInlineFragment() }
                      var asMarticleBulletedList: AsMarticleBulletedList? { _asInlineFragment() }
                      var asMarticleNumberedList: AsMarticleNumberedList? { _asInlineFragment() }
                      var asMarticleBlockquote: AsMarticleBlockquote? { _asInlineFragment() }

                      /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle.AsMarticleText
                      ///
                      /// Parent Type: `MarticleText`
                      struct AsMarticleText: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                        let __data: DataDict
                        init(_dataDict: DataDict) { __data = _dataDict }

                        typealias RootEntityType = SearchSavedItemsQuery.Data.User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle
                        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleText }
                        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                          MarticleTextParts.self,
                          ItemParts.Marticle.AsMarticleText.self
                        ] }

                        /// Markdown text content. Typically, a paragraph.
                        var content: PocketGraph.Markdown { __data["content"] }

                        struct Fragments: FragmentContainer {
                          let __data: DataDict
                          init(_dataDict: DataDict) { __data = _dataDict }

                          var marticleTextParts: MarticleTextParts { _toFragment() }
                        }
                      }

                      /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle.AsImage
                      ///
                      /// Parent Type: `Image`
                      struct AsImage: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                        let __data: DataDict
                        init(_dataDict: DataDict) { __data = _dataDict }

                        typealias RootEntityType = SearchSavedItemsQuery.Data.User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle
                        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Image }
                        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                          ImageParts.self,
                          ItemParts.Marticle.AsImage.self
                        ] }

                        /// A caption or description of the image
                        var caption: String? { __data["caption"] }
                        /// A credit for the image, typically who the image belongs to / created by
                        var credit: String? { __data["credit"] }
                        /// The id for placing within an Article View. Item.article will have placeholders of <div id='RIL_IMG_X' /> where X is this id. Apps can download those images as needed and populate them in their article view.
                        var imageID: Int { __data["imageID"] }
                        /// Absolute url to the image
                        @available(*, deprecated, message: "use url property moving forward")
                        var src: String { __data["src"] }
                        /// The determined height of the image at the url
                        var height: Int? { __data["height"] }
                        /// The determined width of the image at the url
                        var width: Int? { __data["width"] }

                        struct Fragments: FragmentContainer {
                          let __data: DataDict
                          init(_dataDict: DataDict) { __data = _dataDict }

                          var imageParts: ImageParts { _toFragment() }
                        }
                      }

                      /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle.AsMarticleDivider
                      ///
                      /// Parent Type: `MarticleDivider`
                      struct AsMarticleDivider: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                        let __data: DataDict
                        init(_dataDict: DataDict) { __data = _dataDict }

                        typealias RootEntityType = SearchSavedItemsQuery.Data.User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle
                        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleDivider }
                        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                          MarticleDividerParts.self,
                          ItemParts.Marticle.AsMarticleDivider.self
                        ] }

                        /// Always '---'; provided for convenience if building a markdown string
                        var content: PocketGraph.Markdown { __data["content"] }

                        struct Fragments: FragmentContainer {
                          let __data: DataDict
                          init(_dataDict: DataDict) { __data = _dataDict }

                          var marticleDividerParts: MarticleDividerParts { _toFragment() }
                        }
                      }

                      /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle.AsMarticleTable
                      ///
                      /// Parent Type: `MarticleTable`
                      struct AsMarticleTable: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                        let __data: DataDict
                        init(_dataDict: DataDict) { __data = _dataDict }

                        typealias RootEntityType = SearchSavedItemsQuery.Data.User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle
                        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleTable }
                        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                          MarticleTableParts.self,
                          ItemParts.Marticle.AsMarticleTable.self
                        ] }

                        /// Raw HTML representation of the table.
                        var html: String { __data["html"] }

                        struct Fragments: FragmentContainer {
                          let __data: DataDict
                          init(_dataDict: DataDict) { __data = _dataDict }

                          var marticleTableParts: MarticleTableParts { _toFragment() }
                        }
                      }

                      /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle.AsMarticleHeading
                      ///
                      /// Parent Type: `MarticleHeading`
                      struct AsMarticleHeading: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                        let __data: DataDict
                        init(_dataDict: DataDict) { __data = _dataDict }

                        typealias RootEntityType = SearchSavedItemsQuery.Data.User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle
                        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleHeading }
                        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                          MarticleHeadingParts.self,
                          ItemParts.Marticle.AsMarticleHeading.self
                        ] }

                        /// Heading text, in markdown.
                        var content: PocketGraph.Markdown { __data["content"] }
                        /// Heading level. Restricted to values 1-6.
                        var level: Int { __data["level"] }

                        struct Fragments: FragmentContainer {
                          let __data: DataDict
                          init(_dataDict: DataDict) { __data = _dataDict }

                          var marticleHeadingParts: MarticleHeadingParts { _toFragment() }
                        }
                      }

                      /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle.AsMarticleCodeBlock
                      ///
                      /// Parent Type: `MarticleCodeBlock`
                      struct AsMarticleCodeBlock: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                        let __data: DataDict
                        init(_dataDict: DataDict) { __data = _dataDict }

                        typealias RootEntityType = SearchSavedItemsQuery.Data.User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle
                        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleCodeBlock }
                        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                          MarticleCodeBlockParts.self,
                          ItemParts.Marticle.AsMarticleCodeBlock.self
                        ] }

                        /// Content of a pre tag
                        var text: String { __data["text"] }
                        /// Assuming the codeblock was a programming language, this field is used to identify it.
                        var language: Int? { __data["language"] }

                        struct Fragments: FragmentContainer {
                          let __data: DataDict
                          init(_dataDict: DataDict) { __data = _dataDict }

                          var marticleCodeBlockParts: MarticleCodeBlockParts { _toFragment() }
                        }
                      }

                      /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle.AsVideo
                      ///
                      /// Parent Type: `Video`
                      struct AsVideo: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                        let __data: DataDict
                        init(_dataDict: DataDict) { __data = _dataDict }

                        typealias RootEntityType = SearchSavedItemsQuery.Data.User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle
                        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Video }
                        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                          VideoParts.self,
                          ItemParts.Marticle.AsVideo.self
                        ] }

                        /// If known, the height of the video in px
                        var height: Int? { __data["height"] }
                        /// Absolute url to the video
                        var src: String { __data["src"] }
                        /// The type of video
                        var type: GraphQLEnum<PocketGraph.VideoType> { __data["type"] }
                        /// The video's id within the service defined by type
                        var vid: String? { __data["vid"] }
                        /// The id of the video within Article View. Item.article will have placeholders of <div id='RIL_VID_X' /> where X is this id. Apps can download those images as needed and populate them in their article view.
                        var videoID: Int { __data["videoID"] }
                        /// If known, the width of the video in px
                        var width: Int? { __data["width"] }
                        /// If known, the length of the video in seconds
                        var length: Int? { __data["length"] }

                        struct Fragments: FragmentContainer {
                          let __data: DataDict
                          init(_dataDict: DataDict) { __data = _dataDict }

                          var videoParts: VideoParts { _toFragment() }
                        }
                      }

                      /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle.AsMarticleBulletedList
                      ///
                      /// Parent Type: `MarticleBulletedList`
                      struct AsMarticleBulletedList: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                        let __data: DataDict
                        init(_dataDict: DataDict) { __data = _dataDict }

                        typealias RootEntityType = SearchSavedItemsQuery.Data.User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle
                        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleBulletedList }
                        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                          MarticleBulletedListParts.self,
                          ItemParts.Marticle.AsMarticleBulletedList.self
                        ] }

                        var rows: [MarticleBulletedListParts.Row] { __data["rows"] }

                        struct Fragments: FragmentContainer {
                          let __data: DataDict
                          init(_dataDict: DataDict) { __data = _dataDict }

                          var marticleBulletedListParts: MarticleBulletedListParts { _toFragment() }
                        }
                      }

                      /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle.AsMarticleNumberedList
                      ///
                      /// Parent Type: `MarticleNumberedList`
                      struct AsMarticleNumberedList: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                        let __data: DataDict
                        init(_dataDict: DataDict) { __data = _dataDict }

                        typealias RootEntityType = SearchSavedItemsQuery.Data.User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle
                        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleNumberedList }
                        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                          MarticleNumberedListParts.self,
                          ItemParts.Marticle.AsMarticleNumberedList.self
                        ] }

                        var rows: [MarticleNumberedListParts.Row] { __data["rows"] }

                        struct Fragments: FragmentContainer {
                          let __data: DataDict
                          init(_dataDict: DataDict) { __data = _dataDict }

                          var marticleNumberedListParts: MarticleNumberedListParts { _toFragment() }
                        }
                      }

                      /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle.AsMarticleBlockquote
                      ///
                      /// Parent Type: `MarticleBlockquote`
                      struct AsMarticleBlockquote: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                        let __data: DataDict
                        init(_dataDict: DataDict) { __data = _dataDict }

                        typealias RootEntityType = SearchSavedItemsQuery.Data.User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.Marticle
                        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleBlockquote }
                        public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                          MarticleBlockquoteParts.self,
                          ItemParts.Marticle.AsMarticleBlockquote.self
                        ] }

                        /// Markdown text content.
                        var content: PocketGraph.Markdown { __data["content"] }

                        struct Fragments: FragmentContainer {
                          let __data: DataDict
                          init(_dataDict: DataDict) { __data = _dataDict }

                          var marticleBlockquoteParts: MarticleBlockquoteParts { _toFragment() }
                        }
                      }
                    }

                    /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.DomainMetadata
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

                    /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsItem.SyndicatedArticle
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

                  /// User.SearchSavedItems.Edge.Node.SavedItem.Item.AsPendingItem
                  ///
                  /// Parent Type: `PendingItem`
                  struct AsPendingItem: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    typealias RootEntityType = SearchSavedItemsQuery.Data.User.SearchSavedItems.Edge.Node.SavedItem.Item
                    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.PendingItem }
                    public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
                      PendingItemParts.self,
                      SavedItemParts.Item.AsPendingItem.self
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

                /// User.SearchSavedItems.Edge.Node.SavedItem.CorpusItem
                ///
                /// Parent Type: `CorpusItem`
                struct CorpusItem: PocketGraph.SelectionSet {
                  let __data: DataDict
                  init(_dataDict: DataDict) { __data = _dataDict }

                  static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CorpusItem }

                  /// The name of the online publication that published this story.
                  var publisher: String { __data["publisher"] }

                  struct Fragments: FragmentContainer {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    var corpusItemSummary: CorpusItemSummary { _toFragment() }
                  }
                }
              }
            }
          }

          /// User.SearchSavedItems.PageInfo
          ///
          /// Parent Type: `PageInfo`
          struct PageInfo: PocketGraph.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.PageInfo }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("endCursor", String?.self),
              .field("hasNextPage", Bool.self),
              .field("hasPreviousPage", Bool.self),
              .field("startCursor", String?.self),
            ] }

            /// When paginating forwards, the cursor to continue.
            var endCursor: String? { __data["endCursor"] }
            /// When paginating forwards, are there more items?
            var hasNextPage: Bool { __data["hasNextPage"] }
            /// When paginating backwards, are there more items?
            var hasPreviousPage: Bool { __data["hasPreviousPage"] }
            /// When paginating backwards, the cursor to continue.
            var startCursor: String? { __data["startCursor"] }
          }
        }
      }
    }
  }

}