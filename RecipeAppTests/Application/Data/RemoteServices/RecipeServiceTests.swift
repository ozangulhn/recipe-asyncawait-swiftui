//
//  RecipeServiceTests.swift
//  RecipeAppTests
//
//  Created by Ozan Gülhan on 27.07.2022.
//

import XCTest
import Resolver
@testable import RecipeApp

class RecipeServiceTests: XCTestCase {
    var sut: RecipeServiceProtocol!
    
    override func setUpWithError() throws {
        Resolver.setUp()
    }
    
    override func tearDownWithError() throws {
        Resolver.tearDown()
        sut = nil
    }

    func testGetRecipesWithData() async throws {
        let recipes = [RecipeResponse(id: "12", name: "Fried Eggs", price: 12, ingredients: ["Egg": 1])]
        Resolver.register { MockBaseService(model: recipes) as BaseServiceProtocol }
        sut = RecipeRemoteService()
        let expectedModel: [RecipeResponse] = [RecipeResponse(id: "12", name: "Fried Eggs", price: 12, ingredients: ["Egg": 1])]
        
        let uiModels = RecipeUIModel.convert(from: expectedModel)
        
        let resultingRecipes = try await sut.getRecipes()
        XCTAssert(resultingRecipes == uiModels)
        
    }
    
    func testGetRecipesEmptyArray() async throws {
        Resolver.register { MockBaseService(model: [StockResponse]()) as BaseServiceProtocol }
        sut = RecipeRemoteService()
        
        let recipes = try await sut.getRecipes()
        XCTAssert(recipes.isEmpty)
    }
}
