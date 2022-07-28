//
//  StockListView.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 26.07.2022.
//

import SwiftUI
import Resolver

struct StockListView: View {
    
    @Injected private var stocksRepository: StockRepositoryProtocol
    @State private var stocks: [StockUIModel] = []
    @State private var searchText: String = ""
    
    init(stocks: [StockUIModel]) {
        self.stocks = stocks
    }
    
    var body: some View {
        List(stocks) { stock in
            NavigationLink(destination: StockDetailView(stockId: stock.id)) {
                StockCell(stockModel: stock)
            }.swipeActions(edge: .trailing, allowsFullSwipe: false) {
                Button("Delete") {
                    Task {
                        await deleteStock(with: stock.id)
                        await fetchAllStocks()
                    }
                }
            }.tint(Color.red)
        }
        .task {
            await fetchAllStocks()
        }
        .navigationTitle("Stock List View")
        .toolbar {
            HStack {
                NavigationLink {
                    StockDetailView()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    private func fetchAllStocks() async  {
        do {
            self.stocks = try await stocksRepository.getAllStocks()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func deleteStock(with id: String) async {
        do {
            try await stocksRepository.deleteStock(with: id)
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView(stocks: [StockUIModel(id: "12", name: "salt", kg: 12)])
    }
}
