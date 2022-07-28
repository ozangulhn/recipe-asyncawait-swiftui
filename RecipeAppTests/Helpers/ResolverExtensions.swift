//
//  Resolver+XCTest.swift
//  RecipeAppTests
//
//  Created by Ozan Gülhan on 27.07.2022.
//

import XCTest
import Resolver
@testable import RecipeApp

extension Resolver {

    static var test: Resolver!

    static func setUp() {
        Resolver.test = Resolver(child: .main)
        Resolver.root = .test
    }

    static func tearDown() {
        Resolver.root = .main
    }
}
