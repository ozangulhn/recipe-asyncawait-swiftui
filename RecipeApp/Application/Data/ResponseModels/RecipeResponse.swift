//
//  RecipeResponse.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 22.06.2022.
//

import Foundation

struct RecipeResponse: Codable {
    var id: String
    var name: String
    var price: Int
    var ingredients: [String: Int]
    
    
}

