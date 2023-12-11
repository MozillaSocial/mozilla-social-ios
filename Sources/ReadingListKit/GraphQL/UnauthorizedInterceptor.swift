// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import Apollo

class PrependingUnauthorizedInterceptorProvider: InterceptorProvider {
    private let prepend: ApolloInterceptor
    private let base: InterceptorProvider

    init(
        prepend: ApolloInterceptor,
        base: InterceptorProvider
    ) {
        self.prepend = prepend
        self.base = base
    }

    func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation: GraphQLOperation {
        let base = base.interceptors(for: operation)
        return [prepend] + base
    }

    func additionalErrorInterceptor<Operation>(for operation: Operation) -> ApolloErrorInterceptor? where Operation: GraphQLOperation {
        // Utilize a custom interceptor to catch any status code errors, focusing on 401.
        return UnauthorizedErrorInterceptor()
    }
}

private class UnauthorizedErrorInterceptor: ApolloErrorInterceptor {
    func handleErrorAsync<Operation>(
        error: Error,
        chain: Apollo.RequestChain,
        request: Apollo.HTTPRequest<Operation>,
        response: Apollo.HTTPResponse<Operation>?,
        completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, Error>) -> Void
    ) where Operation: ApolloAPI.GraphQLOperation {
        // This case will be sent from a ResponseCodeInterceptor, which is a part of the base DefaultInterceptorProvider
        // that is used by our PrependingUnauthorizedInterceptorProvider. A 401 (Unauthorized) or 403 (Forbidden)  status code
        // will cause this error to be handled. We can capture it, and post a notification  to then log a user out.
        let invalidResponseCodes = [401, 403]
        if case ResponseCodeInterceptor.ResponseCodeError.invalidResponseCode(response: let errorResponse, rawData: _) = error,
           let statusCode = errorResponse?.statusCode,
           invalidResponseCodes.contains(statusCode) {
//            NotificationCenter.default.post(name: .unauthorizedResponse, object: nil)
        }

        // No matter the error, we want to bubble up the failure of the request.
        completion(.failure(error))
    }
}
