//
//  BeverageFormView.swift
//  FoodJournal
//
//  Created by christian gouw on 06/04/22.
//

import SwiftUI

struct BeverageFormView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var image: Image?
    @State private var showImagePicker: Bool = false
    @State private var inputImage: UIImage?
    
    @State private var time: Date = Date.now
    @State private var name: String = ""
    
    @State private var volume: Int = 0
    
    @State private var showSelectReflections: Bool = false
    @State private var selectedReflection: [String] = []
    
    @State private var showSelectFeelings: Bool = false
    @State private var selectedFeeling: String?
    
    @Binding var todayMeals: [TodayMeals]
    
    let reflections: [String] = [
        "Hungry", "It was time", "Social", "Stressed", "Bored", "Love the taste", "Cravings", "Tired"
    ]
    
    let feelings: [String] = [
        "sad", "happy", "greatful"
    ]
    
    var body: some View {
        Form {
            Section {
                // Image picker
                VStack {
                    ZStack {
                        Rectangle()
                            .fill( .bar)
                            .frame(width: 310, height: 200)
                            .cornerRadius(10)
                        
                        Label("Select an image", systemImage: "photo.fill")
                            .font(.body)
                            .foregroundColor(Color.black.opacity(0.6))
                        
                        image?
                            .resizable()
                            .frame(width: 310, height: 200)
                            .cornerRadius(10)
                    }
                    .onTapGesture {
                        showImagePicker = true
                    }
                }
                .onChange(of: inputImage) { _ in loadImage()}
                .sheet(isPresented: $showImagePicker){
                    ImagePicker(image: $inputImage)
                }
                .padding(.vertical, 10)
            }
            
            Section {
                // Name
                TextField("Apple Juice", text: $name)
                    .disableAutocorrection(true)
                
                // Volume
                TextField("300mL", value: $volume, format: .number)
                    .disableAutocorrection(true)
                    .keyboardType(.decimalPad)
                
                // Date
                DatePicker("Selent a time", selection: $time, displayedComponents: .hourAndMinute)
            }
            
            Section {
                // Reflection
                VStack {
                    HStack {
                        Text("Reflections")
                        
                        Spacer()
                        
                        Text("Select")
                            .foregroundColor(.blue)
                            .onTapGesture {
                                showSelectReflections = true
                            }
                    }
                    
                    VStack (alignment: .leading) {
                        if(selectedReflection.count > 0){
                            HStack {
                                ForEach(selectedReflection, id: \.self){ selected in
                                    Text(selected)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                }
                                .padding( .bottom, 10)
                                Spacer()
                            }
                        }
                    }
                }
                .padding(.top, 10)
                .sheet(isPresented: $showSelectReflections){
                    List{
                        ForEach(reflections, id: \.self){ reflection in
                            MultipleReflectionSelection(title: reflection, isSelected: self.selectedReflection.contains(reflection)){
                                if self.selectedReflection.contains(reflection){
                                    self.selectedReflection.removeAll(where: {$0 == reflection})
                                } else {
                                    if (self.selectedReflection.count < 3) {
                                        self.selectedReflection.append(reflection)
                                    }
                                }
                            }
                        }
                    }
                }
                
                VStack {
                    HStack {
                        Text("Feelings")
                        
                        Spacer()
                        
                        Text("Select")
                            .foregroundColor(.blue)
                            .onTapGesture {
                                showSelectFeelings = true
                            }
                    }
                    
                    
                    VStack(alignment: .leading) {
                        if((selectedFeeling?.isEmpty) != nil){
                            HStack {
                                Text("You're feeling \(selectedFeeling ?? "") ")
                                    .padding(.vertical, 5)
                                    .padding( .bottom, 10)
                                Spacer()
                            }
                        }
                    }
                }
                .padding(.top, 10)
                .sheet(isPresented: $showSelectFeelings){
                    List {
                        ForEach(feelings, id: \.self){ feel in
                            FeelingSelection(title: feel, selectedItem: $selectedFeeling)
                        }
                    }
                }
                
            }
            
            Button(action: {
                submit()
            }){
                Text("Save")
            }
            
        }
        .frame(height: 700)
    }
    
    func loadImage() -> Void {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
    
    func formatTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let formattedTime = formatter.string(from: time)
        
        return formattedTime
    }
    
    func submit() -> Void {
        todayMeals.append(
            TodayMeals(
                id: todayMeals.count + 1, name: name, time: formatTime(), timesOfEat: todayMeals.count + 1, image: "Dimsum", category: "beverage", reflections: selectedReflection, feeling: selectedFeeling!, volume: volume
            )
        )
        mode.wrappedValue.dismiss()
    }
}

struct BeverageFormView_Previews: PreviewProvider {
    @State private static var dummy: [TodayMeals] = []
    static var previews: some View {
        BeverageFormView(todayMeals: $dummy)
    }
}
