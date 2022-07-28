//
//  ConverterRegistrations.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 27.07.2022.
//

import Resolver

extension DependencyRegistrationService {
    func registerConverters() {
        Resolver.register { RecipesConverter() as RecipesConverterProtocol }
    }
}
