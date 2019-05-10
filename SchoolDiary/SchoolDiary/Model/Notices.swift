//
//  Notices.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 09/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

enum NoticeType : String, Codable, CaseIterable {
    case health = "Nutrição e Saúde"
    case pedagogy = "Pedagógico"
    case finance = "Financeiro"
    case secretary = "Secretaria"
    case administrative = "Direção"
    
    static var allCases : [NoticeType] {
        return [.administrative, .pedagogy, .finance, .health, .secretary]
    }
}

struct Notice : Codable {
    var title: String
    var type: NoticeType
    var text: String
    var date: Date
}
