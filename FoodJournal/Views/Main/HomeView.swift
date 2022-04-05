//
//  HomeView.swift
//  FoodJournal
//
//  Created by christian gouw on 03/04/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
//                    HStack(){
//                        Text("hello")
//                            .padding(.horizontal)
//
//                        Spacer()
//
//                        Text("hello")
//                            .padding(.horizontal)
//                    }
//                    .frame(width: 360, height: 120, alignment:.leading)
//                    .background(.bar)
//                    .cornerRadius(10.0)
                    
                    NavigationLink(destination: DailyRecap()){
                        Text("Add meal")
                    }
                    
                    // today meal title section
                    HStack(alignment: .center) {
                        Text("Today meals")
                            .font( .title3)
                            .bold()

                        Spacer()

                        NavigationLink(destination: TodayRecap()){
                            Text("view more")
                        }
                    }
                    .padding(.top, 30)
                    // end today meal title section

                    // today meal collections
                    TodayMealScrollView(todayMeals: TodayMeals.all)
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
//            .overlay(
//                AddButton()
//                    .padding(.trailing)
//                    .offset(x:0, y:-60)
//                , alignment: .topTrailing
//            )
        }
        .navigationViewStyle(.stack)
    }
}

//struct AddButton: View {
//    var body: some View {
//        NavigationLink(destination: DailyRecap()){
//            Circle()
//                .frame(width: 50, height: 50)
//                .foregroundColor(.blue)
//        }
//    }
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
