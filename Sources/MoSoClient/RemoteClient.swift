// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation

// TODO: methods will be added here as we have more cases
/// A generic client to obtain MoSo Content types from any api
public protocol RemoteClient {
    /// Retrieves a list of recommendations from a backend service
    /// - Parameter count: maximum number of recommendations to retrieve
    /// - Returns: the recommendations list, or throws an error
    func getRecommendations(count: Int) async throws -> [RemoteRecommendation]
}

public struct RestRemoteClient: RemoteClient {
    public init() {}

    public func getRecommendations(count: Int) async throws -> [RemoteRecommendation] {
        let container: RemoteRecommendations = try await getJsonDecodedData(endpoint: RecommendationsEndpoint(recommendationCount: count))
        return container.recommendations
    }

    /// Dacodes values from a Json response
    /// - Parameter endpoint: the endpoint that returns the Json
    /// - Returns: the decoded data, or throws an error
    private func getJsonDecodedData<Items: Decodable>(endpoint: Endpoint) async throws -> Items {
        let decoder = JSONDecoder()
        let data = try await getData(from: endpoint)
        return try decoder.decode(Items.self, from: data)
    }

    /// Retrieves data from a backend service, gived a URL
    /// - Parameter request: tthe endpoint that returns the data
    /// - Returns: The retrieved data, or throws an error
    private func getData(from endpoint: Endpoint) async throws -> Data {
        let url = try endpoint.url()

        let (data, response) = try await URLSession.shared.data(from: url)

        if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
            throw MoSoClientError.invalidResponse(response.statusCode)
        }
        return data
    }
}

public enum MoSoClientError: Error {
    case consumerKeyNotFound
    case invalidEndpointUrl
    case invalidResponse(Int)
    case invalidImage
}
