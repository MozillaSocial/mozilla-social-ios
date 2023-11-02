// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import PocketGraph

public class User: MockObject {
  public static let objectType: Object = PocketGraph.Objects.User
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<User>>

  public struct MockFields {
    @available(*, deprecated, message: "Use saveById instead")
    @Field<SavedItem>("savedItemById") public var savedItemById
    @Field<SavedItemConnection>("savedItems") public var savedItems
    @Field<SavedItemSearchResultConnection>("searchSavedItems") public var searchSavedItems
    @Field<TagConnection>("tags") public var tags
  }
}

public extension Mock where O == User {
  convenience init(
    savedItemById: Mock<SavedItem>? = nil,
    savedItems: Mock<SavedItemConnection>? = nil,
    searchSavedItems: Mock<SavedItemSearchResultConnection>? = nil,
    tags: Mock<TagConnection>? = nil
  ) {
    self.init()
    _setEntity(savedItemById, for: \.savedItemById)
    _setEntity(savedItems, for: \.savedItems)
    _setEntity(searchSavedItems, for: \.searchSavedItems)
    _setEntity(tags, for: \.tags)
  }
}
