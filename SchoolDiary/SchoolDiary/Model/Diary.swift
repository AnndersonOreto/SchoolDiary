//
//  Diary.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

struct Picture : Codable {
    var image : String
    var description : String
}

enum NapTime : String, Codable {
    case morning = "Manhã"
    case afternoon = "Tarde"
}

struct Nap : Codable {
    var napTime : NapTime
    var start : Date
    var end : Date
}

struct Diary : Codable {
    var date : Date
    var meals : [Meal]
    var naps : [Nap]
    var activities : [Activity]
    var provide: [Provide]
    var bathroom : [Bathroom]
    var medsTaken : [TakenMedicine]  // store the medicine taken, and the time it was taken
    var pictures : [Picture]   // store the photo path and a description for it
    var notes : String
}
