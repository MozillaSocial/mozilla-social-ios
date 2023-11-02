// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import PocketGraph

public class Query: MockObject {
  public static let objectType: Object = PocketGraph.Objects.Query
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Query>>

  public struct MockFields {
    @Field<CorpusSlateLineup>("homeSlateLineup") public var homeSlateLineup
    @Field<Item>("itemByUrl") public var itemByUrl
    @Field<User>("user") public var user
  }
}

public extension Mock where O == Query {
  convenience init(
    homeSlateLineup: Mock<CorpusSlateLineup>? = nil,
    itemByUrl: Mock<Item>? = nil,
    user: Mock<User>? = nil
  ) {
    self.init()
    _setEntity(homeSlateLineup, for: \.homeSlateLineup)
    _setEntity(itemByUrl, for: \.itemByUrl)
    _setEntity(user, for: \.user)
  }
}
