//
//  RecipeListView.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 26.07.2022.
//

import SwiftUI
import Resolver

struct RecipeListView: View {
    @Injected private var recipeRepository: RecipeRepositoryProtocol
    
    @State private var recipes: [RecipeUIModel] = []
    
    var body: some View {
        List(recipes) { recipe in
            RecipeCell(recipe: recipe)
        }.task {
            recipes = await getRecipes()
        }.navigationTitle("Recipes")
    }
    
    
    @MainActor
    private func getRecipes() async -> [RecipeUIModel] {
        do {
            return try await recipeRepository.getRecipes()
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
