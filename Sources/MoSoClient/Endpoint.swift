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

    init(count: Int? = nil) throws {
        guard let info = Bundle.main.infoDictionary, let key = info[Constants.consumerKeyKey] as? String else {
            throw MoSoClientError.consumerKeyNotFound
        }
        var actualCount = Constants.defaultRecommendationsCount
        if let count, count >= 0, count <= Constants.defaultRecommendationsCount {
            actualCount = count
        }
        self.queryItems = [
            URLQueryItem(name: Constants.consumerKey, value: key),
            URLQueryItem(name: Constants.locale, value: Locale.current.language.minimalIdentifier),
            URLQueryItem(name: Constants.region, value: Locale.current.region?.identifier),
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
        static let defaultRecommendationsCount = 30
        static let host = "firefox-api-proxy.cdn.mozilla.net"
        static let scheme = "https"
        // key to retrieve the actual consumer key
        static let consumerKeyKey = "DiscoverApiConsumerKey"
        static let path = "/desktop/v1/recommendations"
        // query items keys
        static let locale = "locale"
        static let region = "region"
        static let count = "count"
        static let consumerKey = "consumer_key"
    }
}
