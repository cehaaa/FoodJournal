//
//  TabBar.swift
//  FoodJournal
//
//  Created by christian gouw on 03/04/22.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem({
                    Label("Home", systemImage: "house")
                })
        
            DailyRecapView()
                .tabItem({
                    Label("Daily recap", systemImage: "heart.text.square.fill")
                })
            
            RecapView()
                .tabItem({
                    Label("Recaps", systemImage: "calendar")
                })
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
