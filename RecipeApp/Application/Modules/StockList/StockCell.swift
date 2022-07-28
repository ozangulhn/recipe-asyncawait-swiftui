//
//  StockCell.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 27.07.2022.
//

import SwiftUI

struct StockCell: View {
    var stockModel: StockUIModel
    
    var body: some View {
        VStack {
            KeyValueView(leftText: "Id", rightText: stockModel.id)
            KeyValueView(leftText: "Name", rightText: stockModel.name)
            KeyValueView(leftText: "Kg", rightText: "\(stockModel.kg)")
        }.onAppear {
            print(stockModel)
        }
    }
}

struct StockCell_Previews: PreviewProvider {
    static var previews: some View {
        StockCell(stockModel: StockUIModel(id: "1", name: "Salt", kg: 12))
    }
}
