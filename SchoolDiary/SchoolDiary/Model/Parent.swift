//
//  Parent.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 30/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

enum FamilyTie : String, Codable, CaseIterable {
    case parent = "Mãe ou Pai"
    case uncle = "Tio(a)"
    case godparent = "Padrinho ou Madrinha"
    case grandparent = "Avô ou Avó"
    case other = "Outro responsável"
    
    static var allCases : [FamilyTie] {
        return [.parent, .uncle, .godparent, .grandparent, .other]
    }
}

protocol Person : Hashable, Codable {
    var name : String { get }
    var birth : Date { get }
    var photo : String { get } // TO-DO: this is probably not a string
}

protocol Responsible : Hashable, Codable {
    var cpf : Int { get }
    var email : String { get }
    var relationship : FamilyTie { get }
    var phone : String { get }
}

struct Relative : Person, Responsible, Hashable, Codable {
    var name: String
    var birth: Date
    var photo: String
    var cpf: Int
    var email: String
    var relationship: FamilyTie
    var phone: String
}

struct Parent : Person, Responsible, Hashable, Codable {
    var name: String
    var birth: Date
    var photo: String
    var cpf: Int
    var email: String
    var phone: String
    var relationship : FamilyTie = .parent
    var password : String
    var invoices : [Invoice]
    var children : [Child]
    
    static func == (lhs: Parent, rhs: Parent) -> Bool {
        return lhs.cpf == rhs.cpf
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.cpf)
    }
}
