//
//  HomeView.swift
//  FoodJournal
//
//  Created by christian gouw on 03/04/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var todayMealsDummy: [TodayMeals] = [
        TodayMeals(id: 1, name: "Dimsum", time: "20:00", timesOfEat: 1, image: "Dimsum", category: "meal", reflections: ["The taste", "It was time"], feeling: "happy"),
        TodayMeals(id: 2, name: "Omelet", time: "21:00", timesOfEat: 2, image: "Omelet", category: "meal", reflections: ["Why not ?"], feeling: "sad"),
        TodayMeals(id: 3, name: "Pancake", time: "22:00", timesOfEat: 3, image: "Pancake", category: "meal", reflections: ["Why not ?", "Social"], feeling: "grateful"),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    // today meal title section
                    HStack(alignment: .center) {
                        Text("Today meals")
                            .font( .title3)
                            .bold()
                        
                        Spacer()
                        
                        NavigationLink(destination: TodayRecap(todayMeals: $todayMealsDummy)){
                            Text("view more")
                        }
                    }
                    .padding(.top, 30)
                    // end today meal title section
                    
                    // today meal collections
                    TodayMealScrollView(todayMeals: todayMealsDummy)
                    // end today meal collections
                    
                    // all recaps title section
                    HStack(alignment: .center) {
                        Text("Recaps")
                            .font( .title3)
                            .bold()
                        
                        Spacer()
                        
                        NavigationLink(destination: DailyRecap()){
                            Text("view more")
                        }
                    }
                    .padding(.top)
                    // end all recaps title section
                    
                    // all recaps collections
                    AllRecapView()
                    // end all recaps collections
                    
                }
                .padding(.horizontal)
            }
            .navigationTitle(Text("Home"))
            .toolbar {
                NavigationLink(destination: FormView(todayMeals: $todayMealsDummy)){
                    Label("capture", systemImage: "plus.square.fill")
                }            }
            .navigationViewStyle(.stack)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
