//
//  RecipeConvertView.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 26.07.2022.
//

import SwiftUI
import Resolver

struct RecipeConvertView: View {
    @Injected private var recipeRepository: RecipeRepositoryProtocol
    private var recipes: [RecipeUIModel] = []
    @State private var convertedRecipes: [String: RecipeWithoutID] = [:]
    
    var body: some View {
        List(convertedRecipes.sorted(by: >), id: \.key) { (key, value) in
            RecipeByIdCell(id: key, recipe: value)
        }.task {
            await fetchRecipes()
        }
    }
    
    private func fetchRecipes() async {
        do {
            try await self.convertedRecipes = recipeRepository.getConvertedRecipes()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct RecipeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeConvertView()
    }
}
