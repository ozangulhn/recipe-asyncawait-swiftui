//
//  Requestable.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 23.06.2022.
//

import Foundation
import Resolver

protocol Requestable {
    associatedtype TargetEndpoint: TargetEndpointProtocol

    func request<T: Decodable>(baseService: BaseServiceProtocol,
                               with object: RequestObject) async throws ->  T
}

extension Requestable {
    func build(targetEndpoint: TargetEndpoint) -> String {
        targetEndpoint.path
    }
    
    func request<T: Decodable>(baseService: BaseServiceProtocol = Resolver.resolve(),
                               with object: RequestObject) async throws ->  T {
        try await baseService.request(with: object)
    }
}
