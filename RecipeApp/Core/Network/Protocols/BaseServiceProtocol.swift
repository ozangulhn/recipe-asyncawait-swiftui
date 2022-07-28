//
//  BaseServiceProtocol.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 22.06.2022.
//

import Foundation

protocol BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject,
                                decoder: JSONDecoder) async throws -> T
}

extension BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject,
                               decoder: JSONDecoder = JSONDecoder()) async throws -> T {
        try await request(with: requestObject, decoder: decoder)
    }
}
