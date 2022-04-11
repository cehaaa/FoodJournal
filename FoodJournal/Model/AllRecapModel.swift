//
//  AllRecapModel.swift
//  FoodJournal
//
//  Created by christian gouw on 09/04/22.
//

import Foundation

struct DailyRecaps {
    let id: Int
    let recaps: [TodayMeals]
    let date: String
    
    let waterVolume: Int
    let reflectionSummary: String
    let feelingSummary: String
    let totalMeal: Int
}
