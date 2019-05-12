//
//  Medicine.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

enum MedicineType : String, Codable {
    case drops = "ml"
    case pills = "mg"
    case other = ""
}

struct Medicine : Codable {
    var name : String
    var dose : Float
    var type : MedicineType
    var condition : String
    var time : Date
}

struct TakenMedicine : Codable {
    var medicine : Medicine
    var timeTaken : Date
}
