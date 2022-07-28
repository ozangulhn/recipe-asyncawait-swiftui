//
//  StringExtensions.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 27.07.2022.
//

import Foundation

extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}
