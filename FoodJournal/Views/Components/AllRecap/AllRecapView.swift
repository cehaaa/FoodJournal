//
//  AllRecapView.swift
//  FoodJournal
//
//  Created by christian gouw on 03/04/22.
//

import SwiftUI

struct AllRecapView: View {
    var body: some View {
//        AllRecapCard()
        VStack(spacing: 10.0){
            AllRecapCard()
        }
    }
}

struct AllRecapView_Previews: PreviewProvider {
    static var previews: some View {
        AllRecapView()
    }
}
