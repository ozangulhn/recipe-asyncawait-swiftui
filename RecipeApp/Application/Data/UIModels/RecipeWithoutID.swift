//
//  RecipeWithoutID.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 27.07.2022.
//

import Foundation
struct RecipeWithoutID: Decodable, Comparable {
    var name: String
    var price: Int
    var ingredients: [String]
    
    var hasCheese: Bool {
        return hasIngredient(query: "cheese")
    }
    
    var hasSalt: Bool {
        return hasIngredient(query: "salt")
    }
    
    func hasIngredient(query: String) -> Bool {
        return ingredients.contains(where: {$0.lowercased().contains(query.lowercased())})
    }
    
    static func < (lhs: RecipeWithoutID, rhs: RecipeWithoutID) -> Bool {
        return lhs.name < rhs.name
    }
    
}

