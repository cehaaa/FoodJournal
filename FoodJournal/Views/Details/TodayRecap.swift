//
//  TodayRecap.swift
//  FoodJournal
//
//  Created by christian gouw on 03/04/22.
//

import SwiftUI

struct TodayRecap: View {
    
    @Binding var todayMeals: [TodayMeals]
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            LazyVStack(spacing: 40) {
                ForEach(todayMeals, id: \.id){ meal in
                    VStack(alignment: .leading){
                        Image(meal.image)
                            .resizable()
                            .frame(width: 360, height: 200)
                            .scaledToFit()
                            .cornerRadius(10)
                        
                        VStack (alignment: .leading) {
                            
                            HStack() {
                                Text("# \(meal.timesOfEat) \(meal.category.capitalized)")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.bottom, 0.2)
                            
                            VStack(alignment: .leading) {
                                
                                HStack {
                                    Text(meal.name)
                                        .font(.title3)
                                        .bold()
                                        .padding(.bottom, 2)
                                    
                                    Text(
                                        meal.feeling == "happy"
                                        ? "😀"
                                        : (meal.feeling == "sad") ? "🙁" : "🥰"
                                    )
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("Reflections")
                                        .padding( .bottom, 1)
                                    
                                    HStack {
                                        ForEach(meal.reflections, id: \.self){ reflection in
                                            Text(reflection)
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 5)
                                                .background(.blue)
                                                .foregroundColor(.white)
                                                .cornerRadius(20)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                Button("Today recap"){
                    
                }
            }
        }
    }
}

struct TodayRecap_Previews: PreviewProvider {
    
    @State private static var dummy: [TodayMeals] = []
    static var previews: some View {        TodayRecap(todayMeals: $dummy)
    }
}
