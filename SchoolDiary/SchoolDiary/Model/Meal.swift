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
    case preDinner = "Pré-Janta"
    case milk = "Leite"
    
    public func mealTime() -> Date? {
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

enum MealQuantity : String, Codable {
    case all = "Tudo"
    case half = "Metade"
    case aLittle = "Um pouco"
    case nothing = "Recusou"
}

struct Meal : Codable {
    var type : MealType
    var quantity : MealQuantity
}
