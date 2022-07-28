//
//  StockService.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 24.06.2022.
//

import Foundation
import Resolver

protocol StockServiceProtocol {
    func getAllStocks() async throws -> [StockUIModel]
    func getStock(by id: String) async throws -> StockUIModel
    func createStock(with item: StockUIModel) async throws
    func updateStock(with id: String, item: StockUIModel) async throws
    func deleteStock(with id: String) async throws
}

class StockRemoteService: StockServiceProtocol, Requestable {
    typealias TargetEndpoint = StockEndpoint
    @Injected private var encoder: JSONEncoder
    
    func getAllStocks() async throws -> [StockUIModel] {
        let endpoint: TargetEndpoint = .readAll
        let stocks: [StockResponse] = try await request(with: endpoint.commonRequestObject)
        let uiModels = StockUIModel.convert(multiple: stocks)
        return uiModels
    }
    
    func getStock(by id: String) async throws -> StockUIModel {
        let endpoint: TargetEndpoint = .readOne(id: id)
        var requestObject = endpoint.commonRequestObject
        requestObject.parameters["id"] = id
        let stock: StockResponse = try await request(with: requestObject)
        let uiModel = StockUIModel.convert(single: stock)
        return uiModel
    }
    
    func createStock(with item: StockUIModel) async throws {
        let newStockObject = StockResponse(id: item.id, name: item.name, kg: item.kg)
        let endpoint: TargetEndpoint = .createOne(model: newStockObject)
        var requestObject = endpoint.commonRequestObject
        requestObject.httpBody = try encoder.encode(newStockObject)
        let _: StockResponse = try await request(with: requestObject)
    }
    
    func updateStock(with id: String, item: StockUIModel) async throws {
        let stockObject = StockResponse(id: id, name: item.name, kg: item.kg)
        let endpoint: TargetEndpoint = .updateOne(id: id, model: stockObject)
        var requestObject = endpoint.commonRequestObject
        requestObject.parameters["id"] = id
        requestObject.httpBody = try encoder.encode(stockObject)
        let _: StockResponse = try await request(with: requestObject)
    }
    
    func deleteStock(with id: String) async throws {
        let endpoint: TargetEndpoint = .deleteOne(id: id)
        var requestObject = endpoint.commonRequestObject
        requestObject.parameters["id"] = id
        let _: StockResponse = try await request(with: requestObject)
    }
}
