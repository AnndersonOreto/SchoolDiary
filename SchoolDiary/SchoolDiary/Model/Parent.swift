//
//  Parent.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

struct Parent : Hashable, Codable {
    static func == (lhs: Parent, rhs: Parent) -> Bool {
        return lhs.cpf == rhs.cpf
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.cpf)
    }
    
    var name : String
    var birth : Date
    var photo : String // TO-DO: this is probably not a string
    var cpf : Int
    var email : String
    var password : String
    var invoices : [Invoice]
    var children : [Child]
}
