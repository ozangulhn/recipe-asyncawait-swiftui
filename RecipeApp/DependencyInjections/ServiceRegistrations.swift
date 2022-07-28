//
//  ServiceRegistrations.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 22.06.2022.
//

import Foundation
import Resolver

extension DependencyRegistrationService {
    func registerServices() {
        Resolver.register { MockRecipeServer() as NetworkLoader }.scope(.application)
        Resolver.register { NetworkService() as BaseServiceProtocol }
        Resolver.register { AuthManager() }
        Resolver.register { JSONDecoder() }
        Resolver.register { JSONEncoder() }
    }
}
