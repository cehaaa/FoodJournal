//
//  AllRecapCard.swift
//  FoodJournal
//
//  Created by christian gouw on 03/04/22.
//

import SwiftUI

struct AllRecapCard: View {
    var body: some View {
        VStack(alignment: .leading){
            Image("Omelet")
                .resizable()
                .frame(width: 360, height: 200)
                .scaledToFit()
            
            VStack (alignment: .leading) {
                Text("SEE SUMMARY")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 0.5)
                    
                
                Text("Saturday, 2 April")
                    .font(.title3)
                    .bold()
                    .padding(.bottom)
                
                Text("3 meals in a day")
                    .foregroundColor(.gray)
                    .padding(.bottom)
            }
            .padding(.horizontal)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 0.3)
        )
        
        VStack(alignment: .leading){
            Image("Pancake")
                .resizable()
                .frame(width: 360, height: 200)
                .scaledToFit()
            
            VStack (alignment: .leading) {
                Text("SEE SUMMARY")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 0.5)
                    
                
                Text("Saturday, 3 April")
                    .font(.title3)
                    .bold()
                    .padding(.bottom)
                
                Text("3 meals in a day")
                    .foregroundColor(.gray)
                    .padding(.bottom)
            }
            .padding(.horizontal)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 0.3)
        )
    }
}

struct AllRecapCard_Previews: PreviewProvider {
    static var previews: some View {
        AllRecapCard()
    }
}
