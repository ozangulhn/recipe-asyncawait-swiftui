//
//  MockLoader.swift
//  RecipeAppTests
//
//  Created by Ozan Gülhan on 27.07.2022.
//

import Foundation
@testable import RecipeApp

class MockLoader: NetworkLoader {
    
    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?

    func load(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completion(data, urlResponse, error)
    }
    
    func load(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data?, URLResponse) {
        if let urlResponse = urlResponse {
            return (data, urlResponse)
        } else {
            throw AppError.badResponse
        }
        
    }
}
