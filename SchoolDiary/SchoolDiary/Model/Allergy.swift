//
//  Allergy.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

enum AllergyType : String, Codable, Hashable, CaseIterable {
    case medicine = "Remédio"
    case food = "Alimento"
    case animal = "Animal"
    case other = "Outros"
    
    static var allCases : [AllergyType] {
        return [.medicine, .food, .animal, .other]
    }
}

struct Allergy : Hashable, Codable {
    var type : AllergyType
    var description : String
}
