//
//  Meal.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

// each school gets to define at which time the meals are served
enum MealType {
    case lunch
    case snack
    case preDinner
    case milk
    
    func mealTime() -> Date? {
        var date = Date()
        
        // TO-DO: expose hour bindings to make them customizable by the school
        switch self {
        case .lunch:
            date.hour = 12
        case .snack:
            date.hour = 15
        case .preDinner:
            date.hour = 17
        case .milk:
            return nil
        }
        
        return date
    }
}

enum MealQuantity {
    case all
    case half
    case aLittle
    case nothing
}

struct Meal {
    var type : MealType
    var quantity : MealQuantity
}
