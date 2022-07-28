//
//  DependencyRegistrationService.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 25.07.2022.
//

import Resolver

protocol Registrationable {
    static func register()
}

class DependencyRegistrationService: NSObject, UIApplicationDelegate {
    typealias Registration = () -> Void
    
    private lazy var registrations: [Registration] = [registerServices,
                                                      registerRepositories,
                                                      registerRemoteServices,
                                                      registerConverters]

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        register()
    }

    private func register() -> Bool {
        Resolver.defaultScope = .graph
        registrations.forEach { $0() }
        return true
    }
}
