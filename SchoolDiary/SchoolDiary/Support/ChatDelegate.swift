//
//  ChatDelegate.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 15/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

protocol ChatDelegate : AnyObject {
    func didSelectChat(sender: MessagesListViewController, chat: (Chat, Contact?))
}
