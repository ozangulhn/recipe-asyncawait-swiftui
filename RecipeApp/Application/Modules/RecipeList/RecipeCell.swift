//
//  RecipeCell.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 26.07.2022.
//

import SwiftUI

struct RecipeCell: View {
    @State private var recipe: RecipeUIModel
    
    init(recipe: RecipeUIModel) {
        self.recipe = recipe
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(recipe.name).font(.system(size: 30))
            HStack(alignment: .center, spacing: 150.0) {
                Text("Price:")
                Text("\(recipe.price)")
            }
            Section {
                Text("Ingredients").font(.system(size: 22))
                ForEach(recipe.ingredients.sorted(by: >), id: \.key) { (key, value) in
                    HStack {
                        Text(key)
                        Spacer()
                        Text("\(value)")
                    }
                }
            }
            .padding(.leading, 17.0)
            
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center)
    }
}

struct RecipeCell_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCell(recipe: .init(id: "11",
                                 name: "Quesedilla",
                                 price: 12,
                                 ingredients: ["Salt": 15,
                                               "Guacamole": 12]))
    }
}
