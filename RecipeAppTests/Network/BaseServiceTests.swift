//
//  BaseServiceTests.swift
//  RecipeAppTests
//
//  Created by Ozan Gülhan on 27.07.2022.
//

import XCTest
@testable import RecipeApp
import Resolver

class BaseServiceTests: XCTestCase {
    var sut: BaseServiceProtocol!
    
    override func setUpWithError() throws {
        Resolver.setUp()
    }

    override func tearDownWithError() throws {
        Resolver.tearDown()
        sut = nil
    }

    func testSuccessfulResponse() async throws {
        let session = MockLoader()
        let expected = "ExpectedString"
        let data = try! JSONEncoder().encode(expected)
        session.data = data
        session.urlResponse = URLResponse()
        Resolver.register { session as NetworkLoader }
        sut = NetworkService()
    
        let requestObject = RequestObject(host: "", path: "/example-path", isSecure: false)
        let response: String = try await sut.request(with: requestObject, decoder: JSONDecoder())
        
        XCTAssertEqual(response, expected)
    }
}
