//
//  FormView.swift
//  FoodJournal
//
//  Created by christian gouw on 06/04/22.
//

import SwiftUI

struct FormView: View {
    
    @State private var selectedForm: FormCategory = .meal
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.systemBlue
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor : UIColor.white
        ]
        
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)

    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators:  false){
            VStack {

                Picker("Choose a category", selection: $selectedForm) {
                    ForEach(FormCategory.allCases, id: \.self){
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)

                ChoosenForm(selectedForm: selectedForm)

            }
            .padding()
        }
        
//        VStack {
//            Picker("Choose a category", selection: $selectedForm) {
//                ForEach(FormCategory.allCases, id: \.self){
//                    Text($0.rawValue)
//                }
//            }
//            .pickerStyle(.segmented)
//
//            ChoosenForm(selectedForm: selectedForm)
//        }
//        .padding()
    }
}

struct ChoosenForm: View {
    var selectedForm: FormCategory
    
    var body: some View {
        switch selectedForm {
        case .meal:
            MealFormView()
            
        case .beverage:
            BeverageFormView()
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
            .preferredColorScheme(.light)
    }
}
