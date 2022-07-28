//
//  HomeView.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 26.07.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 50.0) {
                NavigationLink("Recipes") {
                    RecipeListView()
                }
                NavigationLink("Stocks") {
                    StockListView(stocks: [])
                }
                NavigationLink("Converted Recipes") {
                    RecipeConvertView()
                }
            }.navigationTitle("Home").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
