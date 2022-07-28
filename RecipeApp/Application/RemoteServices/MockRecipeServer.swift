//
//  MockRecipeServer.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 22.06.2022.
//

import Resolver

class MockRecipeServer: NetworkLoader {
    
    private struct MockServerData: Decodable {
        var recipes: [RecipeResponse] = []
        var stocks: [StockResponse] = []
    }
    @Injected private var encoder: JSONEncoder
    @Injected private var decoder: JSONDecoder
    
    private var recipes: [RecipeResponse] = []
    private var stocks: [StockResponse] = []
        
    init() {
        readDB()
    }
    
    private func readDB() {
        if let url = Bundle.main.url(forResource: "RecipesServerData", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode(MockServerData.self, from: data) {
                self.recipes = jsonData.recipes
                self.stocks = jsonData.stocks
            }
        }
    }
    
    func load(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
    }
    
    func load(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data?, URLResponse) {
        if try await checkSecurity(using: request) {
            switch request.url?.path {
            case "/recipe":
                return try await handleForRecipe(request: request)
            case "/stock":
                return try await handleForStock(request: request)
            default:
                throw AppError.invalidUrlRequest
            }
        } else {
            throw AppError.badResponse
        }
    }
    
    private func checkSecurity(using request: URLRequest) async throws -> Bool {
        if request.url?.absoluteString.contains("stock") ?? false {
            let token = request.value(forHTTPHeaderField: "Authorization")
            if token != nil, token == "Bearer newToken-newToken" {
                return true
            }
            return false
        }
        return true
    }

    private func handleForStock(request: URLRequest) async throws -> (Data?, URLResponse) {
        let urlComponents = URLComponents(string: request.url!.absoluteString)!
        let urlResponse = URLResponse(url: request.url!, mimeType: "", expectedContentLength: 128, textEncodingName: "utf8")
        switch request.httpMethod {
        case "GET":
            var matchingObject: [StockResponse]
            if let query = urlComponents.queryItems?.first(where: { $0.name == "id" }) {
                let id = query.value
                matchingObject = stocks.filter({$0.id == id})
                return (try encoder.encode(matchingObject.first ?? nil), urlResponse)
            } else {
                return (try encoder.encode(stocks), urlResponse)
            }
        case "PUT": //UPDATE
            let updatedStockObject = try decoder.decode(StockResponse.self, from: request.httpBody ?? Data())
            if let query = urlComponents.queryItems?.first(where: { $0.name == "id" }),
            let id = query.value,
            let index = stocks.firstIndex(where: { $0.id == id }) {
                stocks[index] = updatedStockObject
                let responseData = try encoder.encode(updatedStockObject)
                return (responseData, urlResponse)
            }
        case "POST": //CREATE
            let newStockObject = try decoder.decode(StockResponse.self, from: request.httpBody ?? Data())
            if stocks.contains(where: {$0.id == newStockObject.id}) {
                throw AppError.invalidID
            }
            stocks.append(newStockObject)
            let responseData = try encoder.encode(newStockObject)
            return (responseData, urlResponse)
        case "DELETE":
            if let query = urlComponents.queryItems?.first(where: { $0.name == "id" }),
                let id = query.value,
                let index = stocks.firstIndex(where: { $0.id == id }) {
                    stocks.remove(at: index)
                return (nil, urlResponse)
            }
        default:
            throw AppError.badResponse
        }
        throw AppError.invalidUrlRequest
    }

    private func handleForRecipe(request: URLRequest) async throws -> (Data?, URLResponse) {
        let urlComponents = URLComponents(string: request.url!.absoluteString)!
        let urlResponse = URLResponse(url: request.url!, mimeType: "", expectedContentLength: 128, textEncodingName: "utf8")
        switch request.httpMethod {
        case "GET":
            var matchingObject: [RecipeResponse]
            if let query = urlComponents.queryItems?.first(where: { $0.name == "id" }) {
                let id = query.value
                matchingObject = recipes.filter({$0.id == id})
                return (try encoder.encode(matchingObject), urlResponse)
            } else {
                return (try encoder.encode(recipes), urlResponse)
            }
        default:
            throw AppError.invalidUrlRequest
        }
    }
}
