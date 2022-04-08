//
//  FeelingSelection.swift
//  FoodJournal
//
//  Created by christian gouw on 08/04/22.
//

import SwiftUI

struct FeelingSelection: View {
    
    let title: String
    @Binding var selectedItem: String?
    
    var body: some View {
        Button(action : {
            self.selectedItem = self.title
        }){
            HStack {
                Text(title)
                
                Spacer()
                
                if(title == selectedItem){
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
