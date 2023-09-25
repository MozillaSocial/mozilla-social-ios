// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Combine
import Foundation
import MoSoClient
import MoSoCore
import UIKit

@MainActor
class ImageLoader: LoadableObject {
    private let url: URL
    @Published var state: LoadingState<UIImage> = .idle

    init(url: URL) {
        self.url = url
    }

    func load() {
        state = .loading

        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)

        Task {
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                // unacceptable status code
                if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    state = .failed(MoSoClientError.invalidResponse(response.statusCode))
                    return
                }
                // data does not contain a valid image
                guard let uiImage = UIImage(data: data) else {
                    state = .failed(MoSoClientError.invalidImage)
                    return
                }
                // image fetched
                state = .ready(uiImage)
            } catch {
                state = .failed(error)
            }
        }
    }
}
