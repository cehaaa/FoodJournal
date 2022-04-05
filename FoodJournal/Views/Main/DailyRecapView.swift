//
//  DailyRecapView.swift
//  FoodJournal
//
//  Created by christian gouw on 03/04/22.
//

import SwiftUI

struct DailyRecapView: View {
    var body: some View {
        NavigationView {
            Text("Daily recap page")
                .navigationTitle("Daily recap")
        }
        .navigationViewStyle(.stack)
    }
}

struct DailyRecapView_Previews: PreviewProvider {
    static var previews: some View {
        DailyRecapView()
    }
}
