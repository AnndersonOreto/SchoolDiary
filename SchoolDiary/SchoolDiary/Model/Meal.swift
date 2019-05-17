//
//  Meal.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

// each school gets to define at which time the meals are served
enum MealType : String, Codable {
    case lunch = "Almoço"
    case snack = "Lanche"
    case snack2 = "Lanche "
    case preDinner = "Pré-Janta"
    case milk = "Leite"
    case milk2 = "Leite "
    
    public func mealTime() -> Date? {
        var date = Date()
        
        // TO-DO: expose hour bindings to make them customizable by the school
        switch self {
        case .lunch:
            date.hour = 11
        case .snack:
            date.hour = 9
        case .snack2:
            date.hour = 14
        case .preDinner:
            date.hour = 17
        case .milk:
            date.hour = 12
        case .milk2:
            date.hour = 18
        }
        
        return date
    }
}

enum MealQuantity : String, Codable {
    case all = "Tudo"
    case half = "Metade"
    case aLittle = "Pouco"
    case nothing = "Recusou"
}

struct Meal : Codable {
    var type : MealType
    var quantity : MealQuantity
}
