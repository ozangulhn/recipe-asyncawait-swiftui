//
//  StockResponse.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 22.06.2022.
//

import Foundation

struct StockResponse: Codable {
    var id: String
    var name: String
    var kg: Int
}

struct BaseResponse: Codable {}
