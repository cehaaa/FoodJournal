//
//  AllRecapView.swift
//  FoodJournal
//
//  Created by christian gouw on 03/04/22.
//

import SwiftUI

struct AllRecapView: View {
    
    @Binding var allRecaps: [DailyRecaps]
    
    var body: some View {
        VStack(spacing: 10.0){
            ForEach(allRecaps, id: \.id){ meal in
                NavigationLink(destination: RecapHistory(history: meal)){
                    AllRecapCard(daily: meal)
                }
            }
        }
    }
}
