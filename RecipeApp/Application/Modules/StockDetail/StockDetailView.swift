//
//  StockDetailView.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 26.07.2022.
//

import SwiftUI
import Resolver

struct StockDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @Injected private var stocksRepository: StockRepositoryProtocol
    @State private var stockModel: StockUIModel?
    
    private var stockId: String?
    
    @State private var id: String = ""
    @State private var name: String = ""
    @State private var kg: String = ""
    @State private var showingAlert: Bool = false
    @State private var alertText: String = ""
    
    init(stockId: String? = nil) {
        self.stockId = stockId
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Spacer()
            Group {
                TextField("Id", text: $id).disabled(stockModel != nil)
                TextField("Name", text: $name)
                TextField("Kg", text: $kg)
            }.multilineTextAlignment(.center)
            .padding(.horizontal, 30.0)
            .font(.system(size: 30))
            .foregroundColor(.black)
        
            Spacer()
            Button("Done") {
                Task {
                    await handleDone()
                }
            }.font(.system(size: 30))
            .foregroundColor(.black)
            .frame(width: 120, height: 80, alignment: .center)
        }.navigationTitle("Stock Detail")
            .alert(alertText, isPresented: $showingAlert) {
                
            }.task {
                if let stockId = stockId {
                    do {
                        let stockModel = try await stocksRepository.getStock(by: stockId)
                        self.stockModel = stockModel
                        id = stockModel.id
                        name = stockModel.name
                        kg = "\(stockModel.kg)"
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
    }
    
    @MainActor
    private func handleDone() async {
        do {
            if let validStock = StockCreateForm(id: id, name: name, kg: kg).validObject {
                if stockModel == nil {
                    try await stocksRepository.createStock(with: validStock)
                } else {
                    try await stocksRepository.updateStock(with: id, item: validStock)
                }
                presentationMode.wrappedValue.dismiss()
            } else {
                alertText = "Invalid form"
                showingAlert = true
            }
        } catch {
            alertText = error.localizedDescription
            showingAlert = true
            
        }
    }
}

struct StockDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StockDetailView()
    }
}
