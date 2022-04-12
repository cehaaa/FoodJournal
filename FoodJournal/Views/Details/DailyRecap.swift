//
//  DailyRecap.swift
//  FoodJournal
//
//  Created by christian gouw on 03/04/22.
//

import SwiftUI

struct DailyRecap: View {
    
    @Binding var allRecap: [DailyRecaps]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVStack {
                ForEach(allRecap, id: \.id){ recap in
//                    AllRecapCard(daily: recap)
                    NavigationLink(destination: RecapHistory(history: recap)){
                        AllRecapCard(daily: recap)
                    }
                }
            }
        }
    }
}

struct DailyRecap_Previews: PreviewProvider {
    
    @State private static var dummy: [DailyRecaps] = [
        DailyRecaps(id: 1, recaps: [
            TodayMeals(id: 1, name: "Dimsum", time: "20:00", timesOfEat: 1, image: "Dimsum", category: "meal", reflections: ["The taste", "It was time"], feeling: "happy", volume: 0),
        ], date: "Friday, 8 Apr", waterVolume: 0, reflectionSummary: "It was time", feelingSummary: "happy", totalMeal: 1),
        
    ]
    
    static var previews: some View {
        DailyRecap(allRecap: $dummy)
    }
}
