//
//  RecipeByIdCell.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 27.07.2022.
//

import SwiftUI
import Resolver

struct RecipeByIdCell: View {
    @State var id: String
    @State var recipe: RecipeWithoutID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            KeyValueView(leftText: "id", rightText: id).font(.system(size: 40))
            Text(recipe.name).font(.system(size: 30))
            HStack(alignment: .center, spacing: 150.0) {
                Text("Price:")
                Text("\(recipe.price)")
            }
            Section {
                Text("Ingredients").font(.system(size: 22))
                ForEach(recipe.ingredients) { ingredient in
                    HStack {
                        Text("\(ingredient)")
                    }
                }
                KeyValueView(leftText: "Has cheese?", rightText: recipe.hasCheese ? "Yes" : "No")
                KeyValueView(leftText: "Has Salt?", rightText: recipe.hasSalt ? "Yes" : "No")
            }
            .padding(.leading, 17.0)
            
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center)
    }
}

struct RecipeByIdCell_Previews: PreviewProvider {
    static var previews: some View {
        RecipeByIdCell(id: "2", recipe: RecipeWithoutID(name: "Quesedilla", price: 12, ingredients: ["Salt", "Bread", "Yoghurt"]))
    }
}
