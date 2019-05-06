//
//  Bathroom.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

enum BathroomType : String, Codable {
    case pee
    case poop
}

enum BathroomCondition : String, Codable {
    case normal
    case altered
    case worrying
}

struct Bathroom : Codable {
    var type : BathroomType
    var condition : BathroomCondition
}
