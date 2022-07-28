//
//  RecipesConverter.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 27.07.2022.
//

import Foundation

protocol RecipesConverterProtocol {
    func convert(recipes: [RecipeUIModel]) -> [String: RecipeWithoutID]
}

class RecipesConverter: RecipesConverterProtocol {
    func convert(recipes: [RecipeUIModel]) -> [String: RecipeWithoutID] {
        var dict: [String: RecipeWithoutID] = [:]
        recipes.forEach { recipe in
            dict[recipe.id] = RecipeWithoutID(name: recipe.name, price: recipe.price, ingredients: Array(recipe.ingredients.keys))
        }
        return dict
    }
}
