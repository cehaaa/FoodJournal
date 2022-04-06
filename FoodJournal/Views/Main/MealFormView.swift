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
    @State private var name: String = ""
    
    @State private var showSelectReflections: Bool = false
    @State private var selectedReflection: [String] = []
    
//    @State private var selectedReflections = Set<String>()
    
    let reflections: [String] = [
        "hungry", "It was time", "Social", "Stressed", "Bored", "Love the taste", "Cravings", "Tired"
    ]
    
//    let rows: [GridItem] = [GridItem(.adaptive(minimum: 35))]
    
    var body: some View {
        
//        ScrollView(.vertical, showsIndicators: false){
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
                
                VStack {
                    HStack {
                        Text("Reflections")
                            .font(.headline)
                        
                        Spacer()
                        
                        Text("Select")
                            .foregroundColor(.blue)
                            .onTapGesture {
                                showSelectReflections = true
                            }
                    }
                    
                    VStack (alignment: .leading) {
                        HStack {
                            ForEach(selectedReflection, id: \.self){ selected in
                                Text(selected)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                
                            }
                            Spacer()
                        }
                    }
                }
                .padding(.bottom)
                .sheet(isPresented: $showSelectReflections){
//                selection: $selectedReflections
                    List{
                        ForEach(reflections, id: \.self){ reflection in
//                            Text(reflection)
                            MultipleReflectionSelection(title: reflection, isSelected: self.selectedReflection.contains(reflection)){
                                if self.selectedReflection.contains(reflection){
                                    self.selectedReflection.removeAll(where: {$0 == reflection})
                                } else {
                                    self.selectedReflection.append(reflection)
                                }
                            }
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("How you feel ?")
                        .font(.headline)
                    HStack {
                        Text("🙁")
                            .frame(width: 100, height: 100)
                            .background(.gray.opacity(0.1))
                            .font(.largeTitle)
                            .cornerRadius(10)
                            .onTapGesture {
                                
                            }
                        
                        Spacer()
                        
                        Text("😀")
                            .frame(width: 100, height: 100)
                            .background(.gray.opacity(0.1))
                            .font(.largeTitle)
                            .cornerRadius(10)
                        
                        Spacer()
                        
                        Text("🥰")
                            .frame(width: 100, height: 100)
                            .background(.gray.opacity(0.1))
                            .font(.largeTitle)
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom)
                
//                List {
//                    ForEach(reflections, id: \.self){reflection in
//                        Text(reflection)
//                    }
//                }
//                .frame(height: 200)
                
                // Reflections
    //            List {
    //                ForEach(reflections, id: \.self){reflection in
    //                    Text(reflection)
    //                }
    //            }
                
                
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
//            .frame(height: .infinity)
//        }
    }
    
    func loadImage() -> Void {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}

struct MultipleReflectionSelection: View {
    
    var title: String
    var isSelected: Bool
    var action: () -> Void
 
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct MealFormView_Previews: PreviewProvider {
    static var previews: some View {
        MealFormView()
    }
}
