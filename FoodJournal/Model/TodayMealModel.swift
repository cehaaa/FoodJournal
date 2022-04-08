//
//  TodayMealModel.swift
//  FoodJournal
//
//  Created by christian gouw on 04/04/22.
//

import Foundation

struct TodayMeals {
    let id: Int
    let name:String
    let time:String
    let timesOfEat: Int
    let image: String
    let category: Category.RawValue
    let reflections: [String]
    let feeling: String
    let volume: String = ""
}
