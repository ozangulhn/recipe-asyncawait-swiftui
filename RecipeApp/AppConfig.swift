//
//  AppConfig.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 23.06.2022.
//

import Foundation

enum AppEnvironment {
    case staging
    case production
}

class AppConfig {
    static var environment: AppEnvironment {
        #if DEBUG
        return .staging
        #else
        return .production
        #endif
    }
    
    static var baseURL: String {
        switch environment {
        case .staging:
            return "dev.recipesdb.com"
        case .production:
            return "recipesdb.com"
        }
    }
}
