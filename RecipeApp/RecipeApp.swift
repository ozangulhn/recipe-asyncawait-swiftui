//
//  RecipeApp.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 21.06.2022.
//

import SwiftUI

@main
struct RecipeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    lazy var appDelegateServices: [UIApplicationDelegate] = [DependencyRegistrationService()]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return appDelegateServices.allSatisfy { service -> Bool in
            service.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? true
        }
    }
}
