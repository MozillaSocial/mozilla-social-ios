// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
// TODO: this will need refactor as we add more services, change apis, etc.

/// generic protocol that describes an endpoint
protocol Endpoint {
    func url() throws -> URL
}

struct RecommendationsEndpoint: Endpoint {
    private let queryItems: [URLQueryItem]

    init(recommendationCount: Int? = nil) throws {
        var actualCount = Constants.defaultRecommendationsCount
        if let recommendationCount, recommendationCount >= 0, recommendationCount <= Constants.defaultRecommendationsCount {
            actualCount = recommendationCount
        }
        self.queryItems = [
            URLQueryItem(name: Constants.locale, value: Locale.current.identifier(.bcp47)),
            URLQueryItem(name: Constants.count, value: "\(actualCount)")
        ]
    }

    func url() throws -> URL {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.host
        components.path = Constants.path
        components.queryItems = self.queryItems

        guard let url = components.url else {
            throw MoSoClientError.invalidEndpointUrl
        }
        return url
    }

    enum Constants {
        static let defaultRecommendationsCount = 24
        static let host = "mozilla.social"
        static let scheme = "https"
        static let path = "/content-feed/moso/v1/discover"
        // query items keys
        static let locale = "locale"
        static let count = "count"
    }
}
