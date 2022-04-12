//
//  AllRecapCard.swift
//  FoodJournal
//
//  Created by christian gouw on 03/04/22.
//

import SwiftUI

struct AllRecapCard: View {
    
    var daily: DailyRecaps
    
    var body: some View {
        VStack(alignment: .leading){
            Image(daily.recaps[0].image)
                .resizable()
                .frame(width: 360, height: 200)
                .scaledToFit()
            
            VStack (alignment: .leading) {
                Text("SEE SUMMARY")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 0.5)
                
                Text(daily.date)
                    .font(.title3)
                    .foregroundColor(.black)
                    .bold()
                    .padding(.bottom)
                
                Text("\(daily.recaps.count) meals in a day")
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
