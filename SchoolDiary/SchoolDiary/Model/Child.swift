//
//  Child.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

struct Child : Codable {
    var name : String
    var birth : Date
    var photo : String // TO-DO: this is probably not a string
    var weight : Float
    var height : Float
    var parents : Set<Parent>
    var medicines : [Medicine]
    var allergies : Set<Allergy>
    var diaries : [Diary]
    var relatives : [Relative]
}
