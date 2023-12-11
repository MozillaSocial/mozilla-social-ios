// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct ItemSummary: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment ItemSummary on Item { __typename remoteID: itemId givenUrl resolvedUrl title language topImageUrl timeToRead domain datePublished isArticle hasImage hasVideo wordCount authors { __typename id name url } excerpt domainMetadata { __typename ...DomainMetadataParts } images { __typename height width src imageId } syndicatedArticle { __typename ...SyndicatedArticleParts } }"#
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
          "excerpt": excerpt,
          "domainMetadata": domainMetadata._fieldData,
          "images": images._fieldData,
          "syndicatedArticle": syndicatedArticle._fieldData,
        ],
        fulfilledFragments: [
          ObjectIdentifier(ItemSummary.self)
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
            ObjectIdentifier(ItemSummary.Author.self)
          ]
        ))
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
            ObjectIdentifier(ItemSummary.DomainMetadata.self),
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
            ObjectIdentifier(ItemSummary.Image.self)
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
            ObjectIdentifier(ItemSummary.SyndicatedArticle.self),
            ObjectIdentifier(SyndicatedArticleParts.self)
          ]
        ))
      }
    }
  }

}