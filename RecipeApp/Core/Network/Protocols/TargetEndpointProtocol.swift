//
//  TargetEndpointProtocol.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 23.06.2022.
//

import Foundation

protocol TargetEndpointProtocol {
    var base: String { get }
    var path: String { get }
    var isSecure: Bool { get }
    var httpMethod: HTTPMethod { get }
    var commonRequestObject: RequestObject { get }
}
