//
//  Allergy.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

enum AllergyType : Hashable {
    case medicine
    case food
    case animal
    case other
}

struct Allergy : Hashable {
    var type : AllergyType
    var description : String
}
