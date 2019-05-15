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
    var senderId: String
    var displayName: String
    var name: String
    var birth: Date     //oops
    var photo: String
    
    init(displayName: String, name: String, birth: Date, photo: String) {
        self.displayName = displayName
        self.name = name
        self.birth = birth
        self.photo = photo
        self.senderId = UUID().uuidString
    }
}

struct Message : MessageType {
    var messageId: String
    var sender: SenderType
    var sentDate: Date
    var text : String
    var kind: MessageKind {
        return .text(text)
    }
    
    init(sender: SenderType, sentDate: Date, text: String) {
        self.sender = sender
        self.sentDate = sentDate
        self.text = text
        self.messageId = UUID().uuidString
    }
}

struct Chat {
    var contact: Contact
    var messages: [Message]
}
