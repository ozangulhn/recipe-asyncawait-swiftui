//
//  RequestObject.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 21.06.2022.
//

import Foundation
import Resolver

struct RequestObject {
    var host: String
    var path: String
    var httpMethod: HTTPMethod
    var parameters: [String: String]
    var headers: [String: String]
    var isSecure: Bool
    var httpBody: Data?
    public init(host: String, path: String,
                httpMethod: HTTPMethod = .get,
                parameters: [String: String] = [:],
                headers: [String: String] = [:],
                isSecure: Bool) {
        self.host = host
        self.path = path
        self.httpMethod = httpMethod
        self.parameters = parameters
        self.headers = headers
        self.isSecure = isSecure
    }
    
    private var endpointComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        if !parameters.isEmpty {
            components.setQueryItems(with: parameters)
        }
        return components
    }

    public func getUrlRequest() throws -> URLRequest {
        guard let url = endpointComponents.url else {
            throw AppError.invalidUrlRequest
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.description
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = httpBody
        return urlRequest
    }
}
