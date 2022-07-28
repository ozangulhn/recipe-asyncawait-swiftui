//
//  URLComponentsExtensions.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 21.06.2022.
//

import Foundation

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
