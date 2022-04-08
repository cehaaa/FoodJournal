//
//  MultipleReflectionSelection.swift
//  FoodJournal
//
//  Created by christian gouw on 08/04/22.
//

import SwiftUI

struct MultipleReflectionSelection: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
 
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
