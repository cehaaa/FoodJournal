//
//  RecapView.swift
//  FoodJournal
//
//  Created by christian gouw on 03/04/22.
//

import SwiftUI

struct RecapView: View {
    var body: some View {
        NavigationView {
            Text("All recaps")
                .navigationTitle("Recaps")
        }
    }
}

struct RecapView_Previews: PreviewProvider {
    static var previews: some View {
        RecapView()
    }
}
