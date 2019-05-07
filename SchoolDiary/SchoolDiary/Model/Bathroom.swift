//
//  Bathroom.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

enum BathroomType : String, Codable {
    case pee = "xixi"
    case poop = "coco"
}

enum BathroomCondition : String, Codable {
    case normal = "Normal"
    case altered = "Alterado"
    case worrying = "Preocupante"
}

struct Bathroom : Codable {
    var type : BathroomType
    var condition : BathroomCondition
}
