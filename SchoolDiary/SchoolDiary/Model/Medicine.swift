//
//  Medicine.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

enum MedicineType {
    case drops
    case pills
    case other
}

struct Medicine {
    var name : String
    var dose : Float
    var type : MedicineType
    var condition : String
    var time : Date
}
