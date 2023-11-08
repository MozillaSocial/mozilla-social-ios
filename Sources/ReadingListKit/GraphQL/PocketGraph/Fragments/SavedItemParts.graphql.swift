// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct SavedItemParts: PocketGraph.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment SavedItemParts on SavedItem { __typename url remoteID: id isArchived isFavorite _deletedAt _createdAt archivedAt tags { __typename ...TagParts } item { __typename ...ItemParts ...PendingItemParts } corpusItem { __typename ...CorpusItemSummary } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SavedItem }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("url", String.self),
    .field("id", alias: "remoteID", PocketGraph.ID.self),
    .field("isArchived", Bool.self),
    .field("isFavorite", Bool.self),
    .field("_deletedAt", Int?.self),
    .field("_createdAt", Int.self),
    .field("archivedAt", Int?.self),
    .field("tags", [Tag]?.self),
    .field("item", Item.self),
    .field("corpusItem", CorpusItem?.self),
  ] }

  /// The url the user saved to their list
  public var url: String { __data["url"] }
  /// Surrogate primary key. This is usually generated by clients, but will be generated by the server if not passed through creation
  public var remoteID: PocketGraph.ID { __data["remoteID"] }
  /// Helper property to indicate if the SavedItem is archived
  public var isArchived: Bool { __data["isArchived"] }
  /// Helper property to indicate if the SavedItem is favorited
  public var isFavorite: Bool { __data["isFavorite"] }
  /// Unix timestamp of when the entity was deleted, 30 days after this date this entity will be HARD deleted from the database and no longer exist
  public var _deletedAt: Int? { __data["_deletedAt"] }
  /// Unix timestamp of when the entity was created
  public var _createdAt: Int { __data["_createdAt"] }
  /// Timestamp that the SavedItem became archied, null if not archived
  public var archivedAt: Int? { __data["archivedAt"] }
  /// The Tags associated with this SavedItem
  public var tags: [Tag]? { __data["tags"] }
  /// Link to the underlying Pocket Item for the URL
  public var item: Item { __data["item"] }
  /// If the item is in corpus allow the saved item to reference it.  Exposing curated info for consistent UX
  public var corpusItem: CorpusItem? { __data["corpusItem"] }

  public init(
    url: String,
    remoteID: PocketGraph.ID,
    isArchived: Bool,
    isFavorite: Bool,
    _deletedAt: Int? = nil,
    _createdAt: Int,
    archivedAt: Int? = nil,
    tags: [Tag]? = nil,
    item: Item,
    corpusItem: CorpusItem? = nil
  ) {
    self.init(_dataDict: DataDict(
      data: [
        "__typename": PocketGraph.Objects.SavedItem.typename,
        "url": url,
        "remoteID": remoteID,
        "isArchived": isArchived,
        "isFavorite": isFavorite,
        "_deletedAt": _deletedAt,
        "_createdAt": _createdAt,
        "archivedAt": archivedAt,
        "tags": tags._fieldData,
        "item": item._fieldData,
        "corpusItem": corpusItem._fieldData,
      ],
      fulfilledFragments: [
        ObjectIdentifier(SavedItemParts.self)
      ]
    ))
  }

  /// Tag
  ///
  /// Parent Type: `Tag`
  public struct Tag: PocketGraph.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Tag }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(TagParts.self),
    ] }

    /// The actual tag string the user created for their list
    public var name: String { __data["name"] }
    /// Surrogate primary key. This is usually generated by clients, but will be generated by the server if not passed through creation
    public var id: PocketGraph.ID { __data["id"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var tagParts: TagParts { _toFragment() }
    }

    public init(
      name: String,
      id: PocketGraph.ID
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.Tag.typename,
          "name": name,
          "id": id,
        ],
        fulfilledFragments: [
          ObjectIdentifier(SavedItemParts.Tag.self),
          ObjectIdentifier(TagParts.self)
        ]
      ))
    }
  }

  /// Item
  ///
  /// Parent Type: `ItemResult`
  public struct Item: PocketGraph.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PocketGraph.Unions.ItemResult }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .inlineFragment(AsItem.self),
      .inlineFragment(AsPendingItem.self),
    ] }

    public var asItem: AsItem? { _asInlineFragment() }
    public var asPendingItem: AsPendingItem? { _asInlineFragment() }

    public init(
      __typename: String
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": __typename,
        ],
        fulfilledFragments: [
          ObjectIdentifier(SavedItemParts.Item.self)
        ]
      ))
    }

    /// Item.AsItem
    ///
    /// Parent Type: `Item`
    public struct AsItem: PocketGraph.InlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = SavedItemParts.Item
      public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Item }
      public static var __selections: [ApolloAPI.Selection] { [
        .fragment(ItemParts.self),
      ] }

      /// The Item entity is owned by the Parser service.
      /// We only extend it in this service to make this service's schema valid.
      /// The key for this entity is the 'itemId'
      public var remoteID: String { __data["remoteID"] }
      /// key field to identify the Item entity in the Parser service
      public var givenUrl: PocketGraph.Url { __data["givenUrl"] }
      /// If the givenUrl redirects (once or many times), this is the final url. Otherwise, same as givenUrl
      public var resolvedUrl: PocketGraph.Url? { __data["resolvedUrl"] }
      /// The title as determined by the parser.
      public var title: String? { __data["title"] }
      /// The detected language of the article
      public var language: String? { __data["language"] }
      /// The page's / publisher's preferred thumbnail image
      @available(*, deprecated, message: "use the topImage object")
      public var topImageUrl: PocketGraph.Url? { __data["topImageUrl"] }
      /// How long it will take to read the article (TODO in what time unit? and by what calculation?)
      public var timeToRead: Int? { __data["timeToRead"] }
      /// The domain, such as 'getpocket.com' of the resolved_url
      public var domain: String? { __data["domain"] }
      /// The date the article was published
      public var datePublished: PocketGraph.DateString? { __data["datePublished"] }
      /// true if the item is an article
      public var isArticle: Bool? { __data["isArticle"] }
      /// 0=no images, 1=contains images, 2=is an image
      public var hasImage: GraphQLEnum<PocketGraph.Imageness>? { __data["hasImage"] }
      /// 0=no videos, 1=contains video, 2=is a video
      public var hasVideo: GraphQLEnum<PocketGraph.Videoness>? { __data["hasVideo"] }
      /// Number of words in the article
      public var wordCount: Int? { __data["wordCount"] }
      /// List of Authors involved with this article
      public var authors: [ItemParts.Author?]? { __data["authors"] }
      /// If the item is a collection allow them to get the collection information
      public var collection: ItemParts.Collection? { __data["collection"] }
      /// The Marticle format of the article, used by clients for native article view.
      public var marticle: [Marticle]? { __data["marticle"] }
      /// A snippet of text from the article
      public var excerpt: String? { __data["excerpt"] }
      /// Additional information about the item domain, when present, use this for displaying the domain name
      public var domainMetadata: DomainMetadata? { __data["domainMetadata"] }
      /// Array of images within an article
      public var images: [ItemParts.Image?]? { __data["images"] }
      /// If the item has a syndicated counterpart the syndication information
      public var syndicatedArticle: SyndicatedArticle? { __data["syndicatedArticle"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var itemParts: ItemParts { _toFragment() }
      }

      public init(
        remoteID: String,
        givenUrl: PocketGraph.Url,
        resolvedUrl: PocketGraph.Url? = nil,
        title: String? = nil,
        language: String? = nil,
        topImageUrl: PocketGraph.Url? = nil,
        timeToRead: Int? = nil,
        domain: String? = nil,
        datePublished: PocketGraph.DateString? = nil,
        isArticle: Bool? = nil,
        hasImage: GraphQLEnum<PocketGraph.Imageness>? = nil,
        hasVideo: GraphQLEnum<PocketGraph.Videoness>? = nil,
        wordCount: Int? = nil,
        authors: [ItemParts.Author?]? = nil,
        collection: ItemParts.Collection? = nil,
        marticle: [Marticle]? = nil,
        excerpt: String? = nil,
        domainMetadata: DomainMetadata? = nil,
        images: [ItemParts.Image?]? = nil,
        syndicatedArticle: SyndicatedArticle? = nil
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": PocketGraph.Objects.Item.typename,
            "remoteID": remoteID,
            "givenUrl": givenUrl,
            "resolvedUrl": resolvedUrl,
            "title": title,
            "language": language,
            "topImageUrl": topImageUrl,
            "timeToRead": timeToRead,
            "domain": domain,
            "datePublished": datePublished,
            "isArticle": isArticle,
            "hasImage": hasImage,
            "hasVideo": hasVideo,
            "wordCount": wordCount,
            "authors": authors._fieldData,
            "collection": collection._fieldData,
            "marticle": marticle._fieldData,
            "excerpt": excerpt,
            "domainMetadata": domainMetadata._fieldData,
            "images": images._fieldData,
            "syndicatedArticle": syndicatedArticle._fieldData,
          ],
          fulfilledFragments: [
            ObjectIdentifier(SavedItemParts.Item.self),
            ObjectIdentifier(SavedItemParts.Item.AsItem.self),
            ObjectIdentifier(ItemParts.self)
          ]
        ))
      }

      /// Item.AsItem.Marticle
      ///
      /// Parent Type: `MarticleComponent`
      public struct Marticle: PocketGraph.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PocketGraph.Unions.MarticleComponent }

        public var asMarticleText: AsMarticleText? { _asInlineFragment() }
        public var asImage: AsImage? { _asInlineFragment() }
        public var asMarticleDivider: AsMarticleDivider? { _asInlineFragment() }
        public var asMarticleTable: AsMarticleTable? { _asInlineFragment() }
        public var asMarticleHeading: AsMarticleHeading? { _asInlineFragment() }
        public var asMarticleCodeBlock: AsMarticleCodeBlock? { _asInlineFragment() }
        public var asVideo: AsVideo? { _asInlineFragment() }
        public var asMarticleBulletedList: AsMarticleBulletedList? { _asInlineFragment() }
        public var asMarticleNumberedList: AsMarticleNumberedList? { _asInlineFragment() }
        public var asMarticleBlockquote: AsMarticleBlockquote? { _asInlineFragment() }

        public init(
          __typename: String
        ) {
          self.init(_dataDict: DataDict(
            data: [
              "__typename": __typename,
            ],
            fulfilledFragments: [
              ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.self)
            ]
          ))
        }

        /// Item.AsItem.Marticle.AsMarticleText
        ///
        /// Parent Type: `MarticleText`
        public struct AsMarticleText: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = SavedItemParts.Item.AsItem.Marticle
          public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleText }
          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
            MarticleTextParts.self,
            ItemParts.Marticle.AsMarticleText.self
          ] }

          /// Markdown text content. Typically, a paragraph.
          public var content: PocketGraph.Markdown { __data["content"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var marticleTextParts: MarticleTextParts { _toFragment() }
          }

          public init(
            content: PocketGraph.Markdown
          ) {
            self.init(_dataDict: DataDict(
              data: [
                "__typename": PocketGraph.Objects.MarticleText.typename,
                "content": content,
              ],
              fulfilledFragments: [
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.self),
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.AsMarticleText.self),
                ObjectIdentifier(MarticleTextParts.self),
                ObjectIdentifier(ItemParts.Marticle.self),
                ObjectIdentifier(ItemParts.Marticle.AsMarticleText.self)
              ]
            ))
          }
        }

        /// Item.AsItem.Marticle.AsImage
        ///
        /// Parent Type: `Image`
        public struct AsImage: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = SavedItemParts.Item.AsItem.Marticle
          public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Image }
          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
            ImageParts.self,
            ItemParts.Marticle.AsImage.self
          ] }

          /// A caption or description of the image
          public var caption: String? { __data["caption"] }
          /// A credit for the image, typically who the image belongs to / created by
          public var credit: String? { __data["credit"] }
          /// The id for placing within an Article View. Item.article will have placeholders of <div id='RIL_IMG_X' /> where X is this id. Apps can download those images as needed and populate them in their article view.
          public var imageID: Int { __data["imageID"] }
          /// Absolute url to the image
          @available(*, deprecated, message: "use url property moving forward")
          public var src: String { __data["src"] }
          /// The determined height of the image at the url
          public var height: Int? { __data["height"] }
          /// The determined width of the image at the url
          public var width: Int? { __data["width"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var imageParts: ImageParts { _toFragment() }
          }

          public init(
            caption: String? = nil,
            credit: String? = nil,
            imageID: Int,
            src: String,
            height: Int? = nil,
            width: Int? = nil
          ) {
            self.init(_dataDict: DataDict(
              data: [
                "__typename": PocketGraph.Objects.Image.typename,
                "caption": caption,
                "credit": credit,
                "imageID": imageID,
                "src": src,
                "height": height,
                "width": width,
              ],
              fulfilledFragments: [
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.self),
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.AsImage.self),
                ObjectIdentifier(ImageParts.self),
                ObjectIdentifier(ItemParts.Marticle.self),
                ObjectIdentifier(ItemParts.Marticle.AsImage.self)
              ]
            ))
          }
        }

        /// Item.AsItem.Marticle.AsMarticleDivider
        ///
        /// Parent Type: `MarticleDivider`
        public struct AsMarticleDivider: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = SavedItemParts.Item.AsItem.Marticle
          public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleDivider }
          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
            MarticleDividerParts.self,
            ItemParts.Marticle.AsMarticleDivider.self
          ] }

          /// Always '---'; provided for convenience if building a markdown string
          public var content: PocketGraph.Markdown { __data["content"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var marticleDividerParts: MarticleDividerParts { _toFragment() }
          }

          public init(
            content: PocketGraph.Markdown
          ) {
            self.init(_dataDict: DataDict(
              data: [
                "__typename": PocketGraph.Objects.MarticleDivider.typename,
                "content": content,
              ],
              fulfilledFragments: [
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.self),
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.AsMarticleDivider.self),
                ObjectIdentifier(MarticleDividerParts.self),
                ObjectIdentifier(ItemParts.Marticle.self),
                ObjectIdentifier(ItemParts.Marticle.AsMarticleDivider.self)
              ]
            ))
          }
        }

        /// Item.AsItem.Marticle.AsMarticleTable
        ///
        /// Parent Type: `MarticleTable`
        public struct AsMarticleTable: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = SavedItemParts.Item.AsItem.Marticle
          public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleTable }
          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
            MarticleTableParts.self,
            ItemParts.Marticle.AsMarticleTable.self
          ] }

          /// Raw HTML representation of the table.
          public var html: String { __data["html"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var marticleTableParts: MarticleTableParts { _toFragment() }
          }

          public init(
            html: String
          ) {
            self.init(_dataDict: DataDict(
              data: [
                "__typename": PocketGraph.Objects.MarticleTable.typename,
                "html": html,
              ],
              fulfilledFragments: [
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.self),
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.AsMarticleTable.self),
                ObjectIdentifier(MarticleTableParts.self),
                ObjectIdentifier(ItemParts.Marticle.self),
                ObjectIdentifier(ItemParts.Marticle.AsMarticleTable.self)
              ]
            ))
          }
        }

        /// Item.AsItem.Marticle.AsMarticleHeading
        ///
        /// Parent Type: `MarticleHeading`
        public struct AsMarticleHeading: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = SavedItemParts.Item.AsItem.Marticle
          public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleHeading }
          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
            MarticleHeadingParts.self,
            ItemParts.Marticle.AsMarticleHeading.self
          ] }

          /// Heading text, in markdown.
          public var content: PocketGraph.Markdown { __data["content"] }
          /// Heading level. Restricted to values 1-6.
          public var level: Int { __data["level"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var marticleHeadingParts: MarticleHeadingParts { _toFragment() }
          }

          public init(
            content: PocketGraph.Markdown,
            level: Int
          ) {
            self.init(_dataDict: DataDict(
              data: [
                "__typename": PocketGraph.Objects.MarticleHeading.typename,
                "content": content,
                "level": level,
              ],
              fulfilledFragments: [
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.self),
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.AsMarticleHeading.self),
                ObjectIdentifier(MarticleHeadingParts.self),
                ObjectIdentifier(ItemParts.Marticle.self),
                ObjectIdentifier(ItemParts.Marticle.AsMarticleHeading.self)
              ]
            ))
          }
        }

        /// Item.AsItem.Marticle.AsMarticleCodeBlock
        ///
        /// Parent Type: `MarticleCodeBlock`
        public struct AsMarticleCodeBlock: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = SavedItemParts.Item.AsItem.Marticle
          public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleCodeBlock }
          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
            MarticleCodeBlockParts.self,
            ItemParts.Marticle.AsMarticleCodeBlock.self
          ] }

          /// Content of a pre tag
          public var text: String { __data["text"] }
          /// Assuming the codeblock was a programming language, this field is used to identify it.
          public var language: Int? { __data["language"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var marticleCodeBlockParts: MarticleCodeBlockParts { _toFragment() }
          }

          public init(
            text: String,
            language: Int? = nil
          ) {
            self.init(_dataDict: DataDict(
              data: [
                "__typename": PocketGraph.Objects.MarticleCodeBlock.typename,
                "text": text,
                "language": language,
              ],
              fulfilledFragments: [
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.self),
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.AsMarticleCodeBlock.self),
                ObjectIdentifier(MarticleCodeBlockParts.self),
                ObjectIdentifier(ItemParts.Marticle.self),
                ObjectIdentifier(ItemParts.Marticle.AsMarticleCodeBlock.self)
              ]
            ))
          }
        }

        /// Item.AsItem.Marticle.AsVideo
        ///
        /// Parent Type: `Video`
        public struct AsVideo: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = SavedItemParts.Item.AsItem.Marticle
          public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Video }
          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
            VideoParts.self,
            ItemParts.Marticle.AsVideo.self
          ] }

          /// If known, the height of the video in px
          public var height: Int? { __data["height"] }
          /// Absolute url to the video
          public var src: String { __data["src"] }
          /// The type of video
          public var type: GraphQLEnum<PocketGraph.VideoType> { __data["type"] }
          /// The video's id within the service defined by type
          public var vid: String? { __data["vid"] }
          /// The id of the video within Article View. Item.article will have placeholders of <div id='RIL_VID_X' /> where X is this id. Apps can download those images as needed and populate them in their article view.
          public var videoID: Int { __data["videoID"] }
          /// If known, the width of the video in px
          public var width: Int? { __data["width"] }
          /// If known, the length of the video in seconds
          public var length: Int? { __data["length"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var videoParts: VideoParts { _toFragment() }
          }

          public init(
            height: Int? = nil,
            src: String,
            type: GraphQLEnum<PocketGraph.VideoType>,
            vid: String? = nil,
            videoID: Int,
            width: Int? = nil,
            length: Int? = nil
          ) {
            self.init(_dataDict: DataDict(
              data: [
                "__typename": PocketGraph.Objects.Video.typename,
                "height": height,
                "src": src,
                "type": type,
                "vid": vid,
                "videoID": videoID,
                "width": width,
                "length": length,
              ],
              fulfilledFragments: [
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.self),
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.AsVideo.self),
                ObjectIdentifier(VideoParts.self),
                ObjectIdentifier(ItemParts.Marticle.self),
                ObjectIdentifier(ItemParts.Marticle.AsVideo.self)
              ]
            ))
          }
        }

        /// Item.AsItem.Marticle.AsMarticleBulletedList
        ///
        /// Parent Type: `MarticleBulletedList`
        public struct AsMarticleBulletedList: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = SavedItemParts.Item.AsItem.Marticle
          public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleBulletedList }
          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
            MarticleBulletedListParts.self,
            ItemParts.Marticle.AsMarticleBulletedList.self
          ] }

          public var rows: [MarticleBulletedListParts.Row] { __data["rows"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var marticleBulletedListParts: MarticleBulletedListParts { _toFragment() }
          }

          public init(
            rows: [MarticleBulletedListParts.Row]
          ) {
            self.init(_dataDict: DataDict(
              data: [
                "__typename": PocketGraph.Objects.MarticleBulletedList.typename,
                "rows": rows._fieldData,
              ],
              fulfilledFragments: [
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.self),
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.AsMarticleBulletedList.self),
                ObjectIdentifier(MarticleBulletedListParts.self),
                ObjectIdentifier(ItemParts.Marticle.self),
                ObjectIdentifier(ItemParts.Marticle.AsMarticleBulletedList.self)
              ]
            ))
          }
        }

        /// Item.AsItem.Marticle.AsMarticleNumberedList
        ///
        /// Parent Type: `MarticleNumberedList`
        public struct AsMarticleNumberedList: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = SavedItemParts.Item.AsItem.Marticle
          public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleNumberedList }
          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
            MarticleNumberedListParts.self,
            ItemParts.Marticle.AsMarticleNumberedList.self
          ] }

          public var rows: [MarticleNumberedListParts.Row] { __data["rows"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var marticleNumberedListParts: MarticleNumberedListParts { _toFragment() }
          }

          public init(
            rows: [MarticleNumberedListParts.Row]
          ) {
            self.init(_dataDict: DataDict(
              data: [
                "__typename": PocketGraph.Objects.MarticleNumberedList.typename,
                "rows": rows._fieldData,
              ],
              fulfilledFragments: [
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.self),
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.AsMarticleNumberedList.self),
                ObjectIdentifier(MarticleNumberedListParts.self),
                ObjectIdentifier(ItemParts.Marticle.self),
                ObjectIdentifier(ItemParts.Marticle.AsMarticleNumberedList.self)
              ]
            ))
          }
        }

        /// Item.AsItem.Marticle.AsMarticleBlockquote
        ///
        /// Parent Type: `MarticleBlockquote`
        public struct AsMarticleBlockquote: PocketGraph.InlineFragment, ApolloAPI.CompositeInlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = SavedItemParts.Item.AsItem.Marticle
          public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleBlockquote }
          public static var __mergedSources: [any ApolloAPI.SelectionSet.Type] { [
            MarticleBlockquoteParts.self,
            ItemParts.Marticle.AsMarticleBlockquote.self
          ] }

          /// Markdown text content.
          public var content: PocketGraph.Markdown { __data["content"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var marticleBlockquoteParts: MarticleBlockquoteParts { _toFragment() }
          }

          public init(
            content: PocketGraph.Markdown
          ) {
            self.init(_dataDict: DataDict(
              data: [
                "__typename": PocketGraph.Objects.MarticleBlockquote.typename,
                "content": content,
              ],
              fulfilledFragments: [
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.self),
                ObjectIdentifier(SavedItemParts.Item.AsItem.Marticle.AsMarticleBlockquote.self),
                ObjectIdentifier(MarticleBlockquoteParts.self),
                ObjectIdentifier(ItemParts.Marticle.self),
                ObjectIdentifier(ItemParts.Marticle.AsMarticleBlockquote.self)
              ]
            ))
          }
        }
      }

      /// Item.AsItem.DomainMetadata
      ///
      /// Parent Type: `DomainMetadata`
      public struct DomainMetadata: PocketGraph.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.DomainMetadata }

        /// The name of the domain (e.g., The New York Times)
        public var name: String? { __data["name"] }
        /// Url for the logo image
        public var logo: PocketGraph.Url? { __data["logo"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var domainMetadataParts: DomainMetadataParts { _toFragment() }
        }

        public init(
          name: String? = nil,
          logo: PocketGraph.Url? = nil
        ) {
          self.init(_dataDict: DataDict(
            data: [
              "__typename": PocketGraph.Objects.DomainMetadata.typename,
              "name": name,
              "logo": logo,
            ],
            fulfilledFragments: [
              ObjectIdentifier(SavedItemParts.Item.AsItem.DomainMetadata.self),
              ObjectIdentifier(DomainMetadataParts.self),
              ObjectIdentifier(ItemParts.DomainMetadata.self)
            ]
          ))
        }
      }

      /// Item.AsItem.SyndicatedArticle
      ///
      /// Parent Type: `SyndicatedArticle`
      public struct SyndicatedArticle: PocketGraph.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SyndicatedArticle }

        /// The item id of this Syndicated Article
        public var itemId: PocketGraph.ID? { __data["itemId"] }
        /// Primary image to use in surfacing this content
        public var mainImage: String? { __data["mainImage"] }
        /// Title of syndicated article
        public var title: String { __data["title"] }
        /// Excerpt 
        public var excerpt: String? { __data["excerpt"] }
        /// The manually set publisher information for this article
        public var publisher: SyndicatedArticleParts.Publisher? { __data["publisher"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var syndicatedArticleParts: SyndicatedArticleParts { _toFragment() }
        }

        public init(
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
              ObjectIdentifier(SavedItemParts.Item.AsItem.SyndicatedArticle.self),
              ObjectIdentifier(SyndicatedArticleParts.self),
              ObjectIdentifier(ItemParts.SyndicatedArticle.self)
            ]
          ))
        }
      }
    }

    /// Item.AsPendingItem
    ///
    /// Parent Type: `PendingItem`
    public struct AsPendingItem: PocketGraph.InlineFragment {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public typealias RootEntityType = SavedItemParts.Item
      public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.PendingItem }
      public static var __selections: [ApolloAPI.Selection] { [
        .fragment(PendingItemParts.self),
      ] }

      /// URL of the item that the user gave for the SavedItem
      /// that is pending processing by parser
      public var remoteID: String { __data["remoteID"] }
      public var givenUrl: PocketGraph.Url { __data["givenUrl"] }
      public var status: GraphQLEnum<PocketGraph.PendingItemStatus>? { __data["status"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var pendingItemParts: PendingItemParts { _toFragment() }
      }

      public init(
        remoteID: String,
        givenUrl: PocketGraph.Url,
        status: GraphQLEnum<PocketGraph.PendingItemStatus>? = nil
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": PocketGraph.Objects.PendingItem.typename,
            "remoteID": remoteID,
            "givenUrl": givenUrl,
            "status": status,
          ],
          fulfilledFragments: [
            ObjectIdentifier(SavedItemParts.Item.self),
            ObjectIdentifier(SavedItemParts.Item.AsPendingItem.self),
            ObjectIdentifier(PendingItemParts.self)
          ]
        ))
      }
    }
  }

  /// CorpusItem
  ///
  /// Parent Type: `CorpusItem`
  public struct CorpusItem: PocketGraph.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.CorpusItem }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(CorpusItemSummary.self),
    ] }

    /// The name of the online publication that published this story.
    public var publisher: String { __data["publisher"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var corpusItemSummary: CorpusItemSummary { _toFragment() }
    }

    public init(
      publisher: String
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": PocketGraph.Objects.CorpusItem.typename,
          "publisher": publisher,
        ],
        fulfilledFragments: [
          ObjectIdentifier(SavedItemParts.CorpusItem.self),
          ObjectIdentifier(CorpusItemSummary.self)
        ]
      ))
    }
  }
}