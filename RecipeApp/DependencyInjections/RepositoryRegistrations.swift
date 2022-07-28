//
//  RepositoryRegistrations.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 22.06.2022.
//

import Foundation
import Resolver

extension DependencyRegistrationService {
    func registerRepositories() {
        Resolver.register { RecipeRepository() as RecipeRepositoryProtocol }
        Resolver.register { StockRepository() as StockRepositoryProtocol }
    }
}
