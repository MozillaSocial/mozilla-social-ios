// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension PocketGraph {
  struct DomainMetadataParts: PocketGraph.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment DomainMetadataParts on DomainMetadata { __typename name logo }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: ApolloAPI.ParentType { PocketGraph.Objects.DomainMetadata }
    static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("name", String?.self),
      .field("logo", PocketGraph.Url?.self),
    ] }

    /// The name of the domain (e.g., The New York Times)
    var name: String? { __data["name"] }
    /// Url for the logo image
    var logo: PocketGraph.Url? { __data["logo"] }

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
          ObjectIdentifier(DomainMetadataParts.self)
        ]
      ))
    }
  }

}