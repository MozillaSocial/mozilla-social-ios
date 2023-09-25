// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation

// TODO: in this simple implementation separating the local and remote type might be overengineering
// In practice, we might deal with more complex mapping and persistence, so let's keep it this way for clarity
/// A type that maps a Recommendation coming from a remote api
public struct RemoteRecommendation: Decodable {
    public let url: String
    public let title: String
    public let excerpt: String
    public let publisher: String
    public let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case url
        case title
        case excerpt
        case publisher
        case imageUrl
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.title = try container.decode(String.self, forKey: .title)
        self.excerpt = try container.decode(String.self, forKey: .excerpt)
        self.publisher = try container.decode(String.self, forKey: .publisher)
        self.imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
    }
}

struct RemoteRecommendations: Decodable {
    public let recommendations: [RemoteRecommendation]

    enum CodingKeys: String, CodingKey {
        case data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        recommendations = try container.decode([RemoteRecommendation].self, forKey: .data)
    }
}
