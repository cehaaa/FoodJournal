//
//  TodayMealModel.swift
//  FoodJournal
//
//  Created by christian gouw on 04/04/22.
//

import Foundation

enum Category: String {
    case meal = "meal"
    case beverage = "beverage"
}

struct TodayMeals {
    let id: Int
    let name:String
    let time:String
    let timesOfEat: Int
    let image: String
    let category: Category.RawValue
    let reflections: [String]
}

extension TodayMeals {
    static let all: [TodayMeals] = [
        TodayMeals(id: 1, name: "Dimsum", time: "20:00", timesOfEat: 1, image: "Dimsum", category: "meal", reflections: ["The taste", "It was time"]),
        TodayMeals(id: 2, name: "Omelet", time: "21:00", timesOfEat: 2, image: "Omelet", category: "meal", reflections: ["Why not ?"]),
    ]
}
