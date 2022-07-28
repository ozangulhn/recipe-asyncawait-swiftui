//
//  StockUIModel.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 22.06.2022.
//

import Foundation

struct StockUIModel: Identifiable {
    var id: String
    var name: String
    var kg: Int
}

extension StockUIModel {
    static func convert(multiple response: [StockResponse]) -> [Self] {
        let uiModels = response.map {convert(single: $0)}
        return uiModels
    }
    
    static func convert(single response: StockResponse) -> Self {
        return StockUIModel(id: response.id, name: response.name, kg: response.kg)
    }
}
