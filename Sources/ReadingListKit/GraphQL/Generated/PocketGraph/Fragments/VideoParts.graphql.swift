// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct VideoParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment VideoParts on Video { __typename height src type vid videoID: videoId width length }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.Video }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("height", Int?.self),
      .field("src", String.self),
      .field("type", GraphQLEnum<PocketGraph.VideoType>.self),
      .field("vid", String?.self),
      .field("videoId", alias: "videoID", Int.self),
      .field("width", Int?.self),
      .field("length", Int?.self),
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
          ObjectIdentifier(VideoParts.self)
        ]
      ))
    }
  }

}