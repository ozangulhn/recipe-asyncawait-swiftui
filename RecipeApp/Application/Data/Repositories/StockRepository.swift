//
//  StockRepository.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 22.06.2022.
//

import Foundation
import Resolver

protocol StockRepositoryProtocol {
    func getAllStocks() async throws -> [StockUIModel]
    func getStock(by id: String) async throws -> StockUIModel
    func createStock(with item: StockUIModel) async throws
    func updateStock(with id: String, item: StockUIModel) async throws
    func deleteStock(with id: String) async throws
}

class StockRepository: StockRepositoryProtocol {
    
    @Injected private var remoteService: StockServiceProtocol
    
    func getAllStocks() async throws -> [StockUIModel] {
        try await remoteService.getAllStocks()
    }

    func getStock(by id: String) async throws -> StockUIModel {
        try await remoteService.getStock(by: id)
    }

    func createStock(with item: StockUIModel) async throws {
        try await remoteService.createStock(with: item)
    }

    func updateStock(with id: String, item: StockUIModel) async throws {
        try await remoteService.updateStock(with: id, item: item)
    }

    func deleteStock(with id: String) async throws {
        try await remoteService.deleteStock(with: id)
    }
}
