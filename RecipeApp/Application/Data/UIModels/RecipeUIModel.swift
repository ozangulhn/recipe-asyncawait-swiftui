//
//  RecipeUIModel.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 22.06.2022.
//

import Foundation

struct RecipeUIModel: Identifiable, Equatable {
    var id: String
    var name: String
    var price: Int
    var ingredients: [String: Int]
}

extension RecipeUIModel {
    static func convert(from response: [RecipeResponse]) -> [Self] {
        let uiModels = response.map { response in
            RecipeUIModel(id: response.id, name: response.name, price: response.price, ingredients: response.ingredients)
        }
        return uiModels
        
    }
}
