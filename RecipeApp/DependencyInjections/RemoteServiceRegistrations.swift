//
//  RemoteServiceRegistrations.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 25.07.2022.
//

import Resolver

extension DependencyRegistrationService {
    func registerRemoteServices() {
        Resolver.register { RecipeRemoteService() as RecipeServiceProtocol }
        Resolver.register { StockRemoteService() as StockServiceProtocol }
    }
}
