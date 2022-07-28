//
//  RecipeEndpoint.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 23.06.2022.
//

import Foundation

enum RecipeEndpoint: TargetEndpointProtocol {
    case allRecipes
    
    var base: String {
        AppConfig.baseURL
    }
    
    var path: String {
        switch self {
        case .allRecipes:
            return "/recipe"
        }
    }
    
    var isSecure: Bool {
        return false
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var commonRequestObject: RequestObject {
        return RequestObject(host: base, path: path, httpMethod: httpMethod, isSecure: isSecure)
    }
}
