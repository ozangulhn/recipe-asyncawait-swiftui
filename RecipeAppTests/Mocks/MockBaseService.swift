//
//  MockBaseService.swift
//  RecipeAppTests
//
//  Created by Ozan Gülhan on 27.07.2022.
//

import Foundation
@testable import RecipeApp

class MockBaseService: BaseServiceProtocol {
    var model: Decodable?
    
    init(model: Decodable?) {
        self.model = model
    }
    
    func request<T>(with requestObject: RequestObject, decoder: JSONDecoder) async throws -> T where T : Decodable {
        if let model = model as? T {
            return model
        } else {
            throw AppError.badResponse
        }
    }
}
