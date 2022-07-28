//
//  RecipeRepository.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 22.06.2022.
//

import Foundation
import Resolver

protocol RecipeRepositoryProtocol {
    func getRecipes() async throws -> [RecipeUIModel]
    func getConvertedRecipes() async throws -> [String: RecipeWithoutID]
}

class RecipeRepository: RecipeRepositoryProtocol {
    @Injected private var recipeConverter: RecipesConverterProtocol
    @Injected private var recipeRemoteService: RecipeServiceProtocol
    
    func getRecipes() async throws -> [RecipeUIModel] {
        try await recipeRemoteService.getRecipes()
    }
    
    func getConvertedRecipes() async throws -> [String: RecipeWithoutID] {
        let recipes = try await getRecipes()
        let converted = recipeConverter.convert(recipes: recipes)
        return converted
    }
}
