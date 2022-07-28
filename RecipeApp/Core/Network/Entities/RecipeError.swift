//
//  AppError.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 21.06.2022.
//

import Foundation

enum AppError: LocalizedError {
    case invalidUrlRequest
    case httpError(status: HTTPStatus, data: Data? = nil)
    case unknown(error: NSError)
    case customError(_ code: Int, _ message: String, _ data: Data? = nil)
    case mappingFailed
    case badResponse
    case invalidID
    
    var errorCode: Int {
        switch self {
            case .httpError(let error, _):
                return error.rawValue
            case .unknown(let error):
                return error.code
            case .customError(let code, _, _):
                return code
            case .mappingFailed, .badResponse, .invalidUrlRequest, .invalidID:
                return 0
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .invalidID:
            return "ID exists or invalid"
        default:
            return "Unknown error"
        }
    }
}
