//
//  Invoice.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 13/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

enum InvoiceSituation : String, Codable, CaseIterable {
    case paid = "Pago"
    case unpaid = "Em aberto"
    case debt = "Em atraso"
    
    static var allCases : [InvoiceSituation] {
        return [.paid, .unpaid, .debt]
    }
}

struct Invoice : Codable {
    var month : Date
    var total : Float
    var situation : InvoiceSituation
    var barcode : Int
}
