//
//  RecipeService.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 22.06.2022.
//

import Foundation

protocol RecipeServiceProtocol {
    func getRecipes() async throws -> [RecipeUIModel]
}

class RecipeRemoteService: RecipeServiceProtocol, Requestable {
    typealias TargetEndpoint = RecipeEndpoint
    
    func getRecipes() async throws -> [RecipeUIModel] {
        let endpoint: TargetEndpoint = .allRecipes
        let recipes: [RecipeResponse] = try await request(with: endpoint.commonRequestObject)
        let uiModels = RecipeUIModel.convert(from: recipes)
        return uiModels
    }
}
