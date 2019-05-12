//
//  Activity.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

enum ActivityType : String, Codable, Hashable, CaseIterable {
    case classes = "Aula"
    case storytelling = "Histórias"
    case games = "Brincadeiras"
    case other = "Outras"
    
    static var allCases : [ActivityType] {
        return [.classes, .storytelling, .games, .other]
    }
}

struct Activity : Hashable, Codable {
    var type : ActivityType
    var description : String
}
