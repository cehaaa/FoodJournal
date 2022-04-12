//
//  FormView.swift
//  FoodJournal
//
//  Created by christian gouw on 06/04/22.
//

import SwiftUI

struct FormView: View {
    
    @State private var selectedForm: FormCategory = .meal
    @Binding var todayMeals: [TodayMeals]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators:  false){
            VStack {
                Picker("Choose a category", selection: $selectedForm) {
                    ForEach(FormCategory.allCases, id: \.self){
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding([.horizontal, .top])
                
                ChoosenForm(todayMeals: $todayMeals, selectedForm: selectedForm)
            }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

struct ChoosenForm: View {
    
    @Binding var todayMeals: [TodayMeals]
    
    var selectedForm: FormCategory
    
    var body: some View {
        switch selectedForm {
        case .meal:
            MealFormView(todayMeals: $todayMeals)
            
        case .beverage:
            BeverageFormView(todayMeals: $todayMeals)
        }
    }
}

struct FormView_Previews: PreviewProvider {
    @State private static var dummy: [TodayMeals] = []
    static var previews: some View {
        FormView(todayMeals: $dummy)
    }
}
