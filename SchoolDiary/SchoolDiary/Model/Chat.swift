//
//  Chat.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 14/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation
import MessageKit

struct Contact : Person, SenderType {
    var senderId: String {
        return UUID().uuidString
    }
    var displayName: String
    var name: String
    var birth: Date     //oops
    var photo: String
}

struct Message : MessageType {
    var sender: SenderType
    var messageId: String {
        return UUID().uuidString
    }
    var sentDate: Date
    var text : String
    var kind: MessageKind {
        return .text(text)
    }
}

struct Chat {
    var contact: Contact
    var messages: [Message]
}
