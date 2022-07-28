//
//  SimpleTextView.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 27.07.2022.
//

import SwiftUI

struct KeyValueView: View {
    var leftText: String
    var rightText: String
    
    init(leftText: String, rightText: String) {
        self.leftText = leftText
        self.rightText = rightText
    }
    
    var body: some View {
        HStack {
            Text(leftText)
            Spacer()
            Text(rightText)
        }
    }
}

struct SimpleTextView_Previews: PreviewProvider {
    static var previews: some View {
        KeyValueView(leftText: "Left Text", rightText: "Right Text")
    }
}
