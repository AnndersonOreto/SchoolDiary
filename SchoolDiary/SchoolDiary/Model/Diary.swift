//
//  Diary.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

struct Diary {
    var date : Date
    var meals : [Meal]
    var naps : [Date]
    var activities : Set<Activity>
    var bathroom : [Bathroom]
    var medsTaken : [(Medicine, Date)]  // store the medicine taken, and the time it was taken
    var pictures : [(String, String)]   // store the photo path and a description for it
    var notes : String
}
