//
//  StockEndpoint.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 23.06.2022.
//

import Foundation

enum StockEndpoint: TargetEndpointProtocol {
    case readAll
    case readOne(id: String)
    case createOne(model: StockResponse)
    case updateOne(id: String, model: StockResponse)
    case deleteOne(id: String)
    
    var base: String {
        return AppConfig.baseURL
    }
    
    var path: String {
        return "/stock"
    }
    
    var isSecure: Bool {
        return true
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .readAll:
            return .get
        case .readOne:
            return .get
        case .createOne:
            return .post
        case .updateOne:
            return .put
        case .deleteOne:
            return .delete
        }
    }
    
    var commonRequestObject: RequestObject {
        return RequestObject(host: base, path: path, httpMethod: httpMethod, isSecure: isSecure)
    }
}
