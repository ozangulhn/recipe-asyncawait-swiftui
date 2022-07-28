//
//  URLSessionExtensions.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 23.06.2022.
//

import Foundation

extension URLSession: NetworkLoader {
    func load(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data?, URLResponse) {
        try await self.data(for: request, delegate: delegate)
    }
    
    func load(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.dataTask(with: request, completionHandler: completion).resume()
    }
}
