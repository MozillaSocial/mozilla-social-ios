// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import PocketGraph

public class Collection: MockObject {
  public static let objectType: Object = PocketGraph.Objects.Collection
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Collection>>

  public struct MockFields {
    @Field<[CollectionAuthor]>("authors") public var authors
    @Field<String>("slug") public var slug
  }
}

public extension Mock where O == Collection {
  convenience init(
    authors: [Mock<CollectionAuthor>]? = nil,
    slug: String? = nil
  ) {
    self.init()
    _setList(authors, for: \.authors)
    _setScalar(slug, for: \.slug)
  }
}
