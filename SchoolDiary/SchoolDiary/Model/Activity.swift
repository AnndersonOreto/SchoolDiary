//
//  Activity.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

enum ActivityType {
    case classes
    case storytelling
    case games
    case other
}

struct Activity {
    var type : ActivityType
    var description : String
}
