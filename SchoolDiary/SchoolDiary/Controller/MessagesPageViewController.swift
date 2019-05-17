//
//  MessagesPageViewController.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 10/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class MessagesPageViewController: UIViewController {
    
    @IBOutlet weak var paneSelector: UISegmentedControl!
    @IBOutlet weak var noticesContainer: UIView!
    @IBOutlet weak var messagesContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        paneSelector.selectedSegmentIndex = 0
        messagesContainer.isHidden = true
        
        paneSelector.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13)], for: .selected)
        
        self.navigationController?.navigationItem.backBarButtonItem?.title = ""
    }
    
    @IBAction func switchPane(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            messagesContainer.isHidden = true
            noticesContainer.isHidden = false
        } else {
            messagesContainer.isHidden = false
            noticesContainer.isHidden = true
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        if segue.identifier == "ShowChat" {
            let chatView = segue.destination as! ChatViewController
            let chatData = sender as! (Chat, Contact?)
            let chat = chatData.0
            let myself = chatData.1 ?? Contact(displayName: "teste", name: "teste", birth: Date(), photo: "")
            
            chatView.messages = chat.messages
            chatView.myself = myself
            chatView.navigationItem.title = chat.contact.displayName
//            print(chat)
        } else if segue.identifier == "EmbedChats" {
            let messagesView = segue.destination as! MessagesListViewController
            messagesView.chatDelegate = self
        }
    }

}

extension MessagesPageViewController: ChatDelegate {
    func didSelectChat(sender: MessagesListViewController, chat: (Chat, Contact?)) {
        performSegue(withIdentifier: "ShowChat", sender: chat)
    }
}
