//
//  MealFormView.swift
//  FoodJournal
//
//  Created by christian gouw on 06/04/22.
//

import SwiftUI

struct MealFormView: View {
    
    @State private var image: Image?
    @State private var showImagePicker: Bool = false
    @State private var inputImage: UIImage?
    
    @State private var time: Date = Date.now
    @State private var name: String = "ex. Sate Ayam"
    
    var reflections: [String] = [
        "hungry", "It was time", "Social", "Stressed", "Bored", "Love the taste", "Cravings", "Tired"
    ]
    
    let rows: [GridItem] = [GridItem(.adaptive(minimum: 35))]
    
    var body: some View {
        VStack {
            
            // image picker
            VStack {
                ZStack {
                    Rectangle()
                        .fill( .bar)
                        .frame(width: 360, height: 200)
                        .cornerRadius(10)
                    
                    Label("Select an image", systemImage: "photo.fill")
                        .font(.body)
                    
                    image?
                        .resizable()
                        .frame(width: 360, height: 200)
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
            .padding(.vertical)
            
            // Date picker
            DatePicker("Select a time", selection: $time, displayedComponents: .hourAndMinute)
                .padding(.bottom)
            
            // Meal name
            TextField("Food name", text: $name)
                .padding()
                .background(
                    Color.gray.opacity(0.1)
                    .cornerRadius(10)
                )
                .font(.headline)
                .foregroundColor(.black)
                .disableAutocorrection(true)
                .padding(.bottom)
            
//            VStack {
//                LazyHGrid(rows: rows) {
//                    ForEach(reflections, id: \.self){ reflection in
//                        Text(reflection)
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 5)
//                            .background(.blue.opacity(0.7))
//                            .foregroundColor(.white)
//                            .cornerRadius(20)
//                    }
//                }
//            }
//            .frame(width: 390, height: 200)
//            .background(.bar)
//            .cornerRadius(10)
        }
    }
    
    func loadImage() -> Void {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}

struct MealFormView_Previews: PreviewProvider {
    static var previews: some View {
        MealFormView()
    }
}
