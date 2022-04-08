//
//  TodayMealCard.swift
//  FoodJournal
//
//  Created by christian gouw on 03/04/22.
//

import SwiftUI

struct TodayMealCard: View {
    
    var todayMeals: TodayMeals
    
    var body: some View {
        VStack(alignment: .leading){
            Image(todayMeals.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 210, height: 210, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                
            
            Text(todayMeals.name)
                .font(.body)
            
            Text("\(todayMeals.timesOfEat) \(todayMeals.category) - \(todayMeals.name)")
                .foregroundColor(.gray)
        }
    }
}
