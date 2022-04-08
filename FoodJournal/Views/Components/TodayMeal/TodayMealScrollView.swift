//
//  TodayMealScrollView.swift
//  FoodJournal
//
//  Created by christian gouw on 03/04/22.
//

import SwiftUI

struct TodayMealScrollView: View {
    
    var todayMeals: [TodayMeals]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack {
                ForEach(todayMeals, id: \.id){ meal in
                    TodayMealCard(todayMeals: meal)
                }
            }
        }
    }
}
