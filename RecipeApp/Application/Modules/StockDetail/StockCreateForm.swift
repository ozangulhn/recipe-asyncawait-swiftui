//
//  StockCreateForm.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 27.07.2022.
//

import Foundation

struct StockCreateForm {
    var id: String?
    var name: String?
    var kg: String?
    
    var validObject: StockUIModel? {
        guard let id = id, let name = name, let kg = kg else {
            return nil
        }
        if !id.isEmpty && !name.isEmpty && UInt(kg) != nil {
            return StockUIModel(id: id, name: name, kg: Int(kg)!)
        } else {
            return nil
        }
    }
}
