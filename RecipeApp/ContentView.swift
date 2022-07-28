//
//  ContentView.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 21.06.2022.
//

import SwiftUI
import Resolver

struct ContentView: View {
    @Injected var stocksRepository: StockRepositoryProtocol
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .task {
                await loadStocks()
            }
    }
    
    private func loadStocks() async {
        do {
            let stocks = try await stocksRepository.createStock(with: StockUIModel(id: "8", name: "Salt", kg: 12))
            print(stocks)
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
