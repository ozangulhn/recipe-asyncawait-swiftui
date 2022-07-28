//
//  HTTPMethod.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 21.06.2022.
//

import Foundation

enum HTTPMethod: String, CustomStringConvertible {
    case get
    case post
    case put
    case delete

    var description: String {
        rawValue.uppercased()
    }
}
