//
//  ConsumedForm.swift
//  FoodJournal
//
//  Created by christian gouw on 05/04/22.
//

import SwiftUI

struct ConsumedForm: View {
    
    @State private var image: Image?
    @State private var showImagePicker: Bool = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {            
            ZStack {
                Rectangle()
                    .fill( .bar)
                    .frame(width: 360, height: 200)
                    .cornerRadius(10)
                
                Label("Select an image", systemImage: "photo.fill")
                    .font(.title3)
                
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
    }
     
    func loadImage() -> Void {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}

struct ConsumedForm_Previews: PreviewProvider {
    static var previews: some View {
        ConsumedForm()
    }
}
