// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct ItemParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment ItemParts on Item { __typename remoteID: itemId givenUrl resolvedUrl title language topImageUrl timeToRead domain datePublished isArticle hasImage hasVideo wordCount authors { __typename id name url } collection { __typename slug } marticle { __typename ...MarticleTextParts ...ImageParts ...MarticleDividerParts ...MarticleTableParts ...MarticleHeadingParts ...MarticleCodeBlockParts ...VideoParts ...MarticleBulletedListParts ...MarticleNumberedListParts ...MarticleBlockquoteParts } excerpt domainMetadata { __typename ...DomainMetadataParts } images { __typename height width src imageId } syndicatedArticle { __typename ...SyndicatedArticleParts } }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Item }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("itemId", alias: "remoteID", String.self),
      .field("givenUrl", PocketGraph.Url.self),
      .field("resolvedUrl", PocketGraph.Url?.self),
      .field("title", String?.self),
      .field("language", String?.self),
      .field("topImageUrl", PocketGraph.Url?.self),
      .field("timeToRead", Int?.self),
      .field("domain", String?.self),
      .field("datePublished", PocketGraph.DateString?.self),
      .field("isArticle", Bool?.self),
      .field("hasImage", GraphQLEnum<PocketGraph.Imageness>?.self),
      .field("hasVideo", GraphQLEnum<PocketGraph.Videoness>?.self),
      .field("wordCount", Int?.self),
      .field("authors", [Author?]?.self),
      .field("collection", Collection?.self),
      .field("marticle", [Marticle]?.self),
      .field("excerpt", String?.self),
      .field("domainMetadata", DomainMetadata?.self),
      .field("images", [Image?]?.self),
      .field("syndicatedArticle", SyndicatedArticle?.self),
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
    var authors: [Author?]? { __data["authors"] }
    /// If the item is a collection allow them to get the collection information
    var collection: Collection? { __data["collection"] }
    /// The Marticle format of the article, used by clients for native article view.
    var marticle: [Marticle]? { __data["marticle"] }
    /// A snippet of text from the article
    var excerpt: String? { __data["excerpt"] }
    /// Additional information about the item domain, when present, use this for displaying the domain name
    var domainMetadata: DomainMetadata? { __data["domainMetadata"] }
    /// Array of images within an article
    var images: [Image?]? { __data["images"] }
    /// If the item has a syndicated counterpart the syndication information
    var syndicatedArticle: SyndicatedArticle? { __data["syndicatedArticle"] }

    init(
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
      authors: [Author?]? = nil,
      collection: Collection? = nil,
      marticle: [Marticle]? = nil,
      excerpt: String? = nil,
      domainMetadata: DomainMetadata? = nil,
      images: [Image?]? = nil,
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
          ObjectIdentifier(ItemParts.self)
        ]
      ))
    }

    /// Author
    ///
    /// Parent Type: `Author`
    struct Author: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Author }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", PocketGraph.ID.self),
        .field("name", String?.self),
        .field("url", String?.self),
      ] }

      /// Unique id for that Author
      var id: PocketGraph.ID { __data["id"] }
      /// Display name
      var name: String? { __data["name"] }
      /// A url to that Author's site
      var url: String? { __data["url"] }

      init(
        id: PocketGraph.ID,
        name: String? = nil,
        url: String? = nil
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": PocketGraph.Objects.Author.typename,
            "id": id,
            "name": name,
            "url": url,
          ],
          fulfilledFragments: [
            ObjectIdentifier(ItemParts.Author.self)
          ]
        ))
      }
    }

    /// Collection
    ///
    /// Parent Type: `Collection`
    struct Collection: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Collection }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("slug", String.self),
      ] }

      var slug: String { __data["slug"] }

      init(
        slug: String
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": PocketGraph.Objects.Collection.typename,
            "slug": slug,
          ],
          fulfilledFragments: [
            ObjectIdentifier(ItemParts.Collection.self)
          ]
        ))
      }
    }

    /// Marticle
    ///
    /// Parent Type: `MarticleComponent`
    struct Marticle: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Unions.MarticleComponent }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .inlineFragment(AsMarticleText.self),
        .inlineFragment(AsImage.self),
        .inlineFragment(AsMarticleDivider.self),
        .inlineFragment(AsMarticleTable.self),
        .inlineFragment(AsMarticleHeading.self),
        .inlineFragment(AsMarticleCodeBlock.self),
        .inlineFragment(AsVideo.self),
        .inlineFragment(AsMarticleBulletedList.self),
        .inlineFragment(AsMarticleNumberedList.self),
        .inlineFragment(AsMarticleBlockquote.self),
      ] }

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

      init(
        __typename: String
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": __typename,
          ],
          fulfilledFragments: [
            ObjectIdentifier(ItemParts.Marticle.self)
          ]
        ))
      }

      /// Marticle.AsMarticleText
      ///
      /// Parent Type: `MarticleText`
      struct AsMarticleText: PocketGraph.InlineFragment {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        typealias RootEntityType = ItemParts.Marticle
        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleText }
        static var __selections: [ApolloAPI.Selection] { [
          .fragment(MarticleTextParts.self),
        ] }

        /// Markdown text content. Typically, a paragraph.
        var content: PocketGraph.Markdown { __data["content"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var marticleTextParts: MarticleTextParts { _toFragment() }
        }

        init(
          content: PocketGraph.Markdown
        ) {
          self.init(_dataDict: DataDict(
            data: [
              "__typename": PocketGraph.Objects.MarticleText.typename,
              "content": content,
            ],
            fulfilledFragments: [
              ObjectIdentifier(ItemParts.Marticle.self),
              ObjectIdentifier(ItemParts.Marticle.AsMarticleText.self),
              ObjectIdentifier(MarticleTextParts.self)
            ]
          ))
        }
      }

      /// Marticle.AsImage
      ///
      /// Parent Type: `Image`
      struct AsImage: PocketGraph.InlineFragment {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        typealias RootEntityType = ItemParts.Marticle
        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Image }
        static var __selections: [ApolloAPI.Selection] { [
          .fragment(ImageParts.self),
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

        init(
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
              ObjectIdentifier(ItemParts.Marticle.self),
              ObjectIdentifier(ItemParts.Marticle.AsImage.self),
              ObjectIdentifier(ImageParts.self)
            ]
          ))
        }
      }

      /// Marticle.AsMarticleDivider
      ///
      /// Parent Type: `MarticleDivider`
      struct AsMarticleDivider: PocketGraph.InlineFragment {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        typealias RootEntityType = ItemParts.Marticle
        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleDivider }
        static var __selections: [ApolloAPI.Selection] { [
          .fragment(MarticleDividerParts.self),
        ] }

        /// Always '---'; provided for convenience if building a markdown string
        var content: PocketGraph.Markdown { __data["content"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var marticleDividerParts: MarticleDividerParts { _toFragment() }
        }

        init(
          content: PocketGraph.Markdown
        ) {
          self.init(_dataDict: DataDict(
            data: [
              "__typename": PocketGraph.Objects.MarticleDivider.typename,
              "content": content,
            ],
            fulfilledFragments: [
              ObjectIdentifier(ItemParts.Marticle.self),
              ObjectIdentifier(ItemParts.Marticle.AsMarticleDivider.self),
              ObjectIdentifier(MarticleDividerParts.self)
            ]
          ))
        }
      }

      /// Marticle.AsMarticleTable
      ///
      /// Parent Type: `MarticleTable`
      struct AsMarticleTable: PocketGraph.InlineFragment {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        typealias RootEntityType = ItemParts.Marticle
        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleTable }
        static var __selections: [ApolloAPI.Selection] { [
          .fragment(MarticleTableParts.self),
        ] }

        /// Raw HTML representation of the table.
        var html: String { __data["html"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var marticleTableParts: MarticleTableParts { _toFragment() }
        }

        init(
          html: String
        ) {
          self.init(_dataDict: DataDict(
            data: [
              "__typename": PocketGraph.Objects.MarticleTable.typename,
              "html": html,
            ],
            fulfilledFragments: [
              ObjectIdentifier(ItemParts.Marticle.self),
              ObjectIdentifier(ItemParts.Marticle.AsMarticleTable.self),
              ObjectIdentifier(MarticleTableParts.self)
            ]
          ))
        }
      }

      /// Marticle.AsMarticleHeading
      ///
      /// Parent Type: `MarticleHeading`
      struct AsMarticleHeading: PocketGraph.InlineFragment {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        typealias RootEntityType = ItemParts.Marticle
        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleHeading }
        static var __selections: [ApolloAPI.Selection] { [
          .fragment(MarticleHeadingParts.self),
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

        init(
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
              ObjectIdentifier(ItemParts.Marticle.self),
              ObjectIdentifier(ItemParts.Marticle.AsMarticleHeading.self),
              ObjectIdentifier(MarticleHeadingParts.self)
            ]
          ))
        }
      }

      /// Marticle.AsMarticleCodeBlock
      ///
      /// Parent Type: `MarticleCodeBlock`
      struct AsMarticleCodeBlock: PocketGraph.InlineFragment {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        typealias RootEntityType = ItemParts.Marticle
        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleCodeBlock }
        static var __selections: [ApolloAPI.Selection] { [
          .fragment(MarticleCodeBlockParts.self),
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

        init(
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
              ObjectIdentifier(ItemParts.Marticle.self),
              ObjectIdentifier(ItemParts.Marticle.AsMarticleCodeBlock.self),
              ObjectIdentifier(MarticleCodeBlockParts.self)
            ]
          ))
        }
      }

      /// Marticle.AsVideo
      ///
      /// Parent Type: `Video`
      struct AsVideo: PocketGraph.InlineFragment {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        typealias RootEntityType = ItemParts.Marticle
        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Video }
        static var __selections: [ApolloAPI.Selection] { [
          .fragment(VideoParts.self),
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

        init(
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
              ObjectIdentifier(ItemParts.Marticle.self),
              ObjectIdentifier(ItemParts.Marticle.AsVideo.self),
              ObjectIdentifier(VideoParts.self)
            ]
          ))
        }
      }

      /// Marticle.AsMarticleBulletedList
      ///
      /// Parent Type: `MarticleBulletedList`
      struct AsMarticleBulletedList: PocketGraph.InlineFragment {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        typealias RootEntityType = ItemParts.Marticle
        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleBulletedList }
        static var __selections: [ApolloAPI.Selection] { [
          .fragment(MarticleBulletedListParts.self),
        ] }

        var rows: [MarticleBulletedListParts.Row] { __data["rows"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var marticleBulletedListParts: MarticleBulletedListParts { _toFragment() }
        }

        init(
          rows: [MarticleBulletedListParts.Row]
        ) {
          self.init(_dataDict: DataDict(
            data: [
              "__typename": PocketGraph.Objects.MarticleBulletedList.typename,
              "rows": rows._fieldData,
            ],
            fulfilledFragments: [
              ObjectIdentifier(ItemParts.Marticle.self),
              ObjectIdentifier(ItemParts.Marticle.AsMarticleBulletedList.self),
              ObjectIdentifier(MarticleBulletedListParts.self)
            ]
          ))
        }
      }

      /// Marticle.AsMarticleNumberedList
      ///
      /// Parent Type: `MarticleNumberedList`
      struct AsMarticleNumberedList: PocketGraph.InlineFragment {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        typealias RootEntityType = ItemParts.Marticle
        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleNumberedList }
        static var __selections: [ApolloAPI.Selection] { [
          .fragment(MarticleNumberedListParts.self),
        ] }

        var rows: [MarticleNumberedListParts.Row] { __data["rows"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var marticleNumberedListParts: MarticleNumberedListParts { _toFragment() }
        }

        init(
          rows: [MarticleNumberedListParts.Row]
        ) {
          self.init(_dataDict: DataDict(
            data: [
              "__typename": PocketGraph.Objects.MarticleNumberedList.typename,
              "rows": rows._fieldData,
            ],
            fulfilledFragments: [
              ObjectIdentifier(ItemParts.Marticle.self),
              ObjectIdentifier(ItemParts.Marticle.AsMarticleNumberedList.self),
              ObjectIdentifier(MarticleNumberedListParts.self)
            ]
          ))
        }
      }

      /// Marticle.AsMarticleBlockquote
      ///
      /// Parent Type: `MarticleBlockquote`
      struct AsMarticleBlockquote: PocketGraph.InlineFragment {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        typealias RootEntityType = ItemParts.Marticle
        static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.MarticleBlockquote }
        static var __selections: [ApolloAPI.Selection] { [
          .fragment(MarticleBlockquoteParts.self),
        ] }

        /// Markdown text content.
        var content: PocketGraph.Markdown { __data["content"] }

        struct Fragments: FragmentContainer {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          var marticleBlockquoteParts: MarticleBlockquoteParts { _toFragment() }
        }

        init(
          content: PocketGraph.Markdown
        ) {
          self.init(_dataDict: DataDict(
            data: [
              "__typename": PocketGraph.Objects.MarticleBlockquote.typename,
              "content": content,
            ],
            fulfilledFragments: [
              ObjectIdentifier(ItemParts.Marticle.self),
              ObjectIdentifier(ItemParts.Marticle.AsMarticleBlockquote.self),
              ObjectIdentifier(MarticleBlockquoteParts.self)
            ]
          ))
        }
      }
    }

    /// DomainMetadata
    ///
    /// Parent Type: `DomainMetadata`
    struct DomainMetadata: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.DomainMetadata }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(DomainMetadataParts.self),
      ] }

      /// The name of the domain (e.g., The New York Times)
      var name: String? { __data["name"] }
      /// Url for the logo image
      var logo: PocketGraph.Url? { __data["logo"] }

      struct Fragments: FragmentContainer {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        var domainMetadataParts: DomainMetadataParts { _toFragment() }
      }

      init(
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
            ObjectIdentifier(ItemParts.DomainMetadata.self),
            ObjectIdentifier(DomainMetadataParts.self)
          ]
        ))
      }
    }

    /// Image
    ///
    /// Parent Type: `Image`
    struct Image: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Image }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("height", Int?.self),
        .field("width", Int?.self),
        .field("src", String.self),
        .field("imageId", Int.self),
      ] }

      /// The determined height of the image at the url
      var height: Int? { __data["height"] }
      /// The determined width of the image at the url
      var width: Int? { __data["width"] }
      /// Absolute url to the image
      @available(*, deprecated, message: "use url property moving forward")
      var src: String { __data["src"] }
      /// The id for placing within an Article View. Item.article will have placeholders of <div id='RIL_IMG_X' /> where X is this id. Apps can download those images as needed and populate them in their article view.
      var imageId: Int { __data["imageId"] }

      init(
        height: Int? = nil,
        width: Int? = nil,
        src: String,
        imageId: Int
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": PocketGraph.Objects.Image.typename,
            "height": height,
            "width": width,
            "src": src,
            "imageId": imageId,
          ],
          fulfilledFragments: [
            ObjectIdentifier(ItemParts.Image.self)
          ]
        ))
      }
    }

    /// SyndicatedArticle
    ///
    /// Parent Type: `SyndicatedArticle`
    struct SyndicatedArticle: PocketGraph.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.SyndicatedArticle }
      static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
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
            ObjectIdentifier(ItemParts.SyndicatedArticle.self),
            ObjectIdentifier(SyndicatedArticleParts.self)
          ]
        ))
      }
    }
  }

}