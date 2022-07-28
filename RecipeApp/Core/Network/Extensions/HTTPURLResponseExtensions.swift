//
//  HTTPURLResponseExtensions.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 22.06.2022.
//

import Foundation

extension HTTPURLResponse {
    var httpStatus: HTTPStatus? {
        HTTPStatus(rawValue: statusCode)
    }
}
