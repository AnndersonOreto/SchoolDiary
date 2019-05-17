//
//  Bathroom.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

enum BathroomType : String, Codable {
    case pee = "Xixi"
    case poop = "Cocô"
}

enum BathroomCondition : String, Codable, CaseIterable {
    case normal = "Normal"
    case altered = "Alterado"
    case worrying = "Preocupante"
    
    static var allCases : [BathroomCondition] {
        return [.normal, .altered, .worrying]
    }
}

struct Bathroom : Codable {
    var type : BathroomType
    var condition : BathroomCondition
}
