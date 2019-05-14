//
//  MessagesViewController.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 10/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var chats: [Chat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChats()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 76
    }
    
    func setupChats() {
        let ana = Contact(displayName: "Professora Ana", name: "Ana", birth: Date().changing(.year, value: 1976)!, photo: "Ana")
        let michele = Contact(displayName: "Diretora Michele", name: "Michele", birth: Date().changing(.year, value: 1964)!, photo: "Michele")
        let myself = Contact(displayName: Storage.parents.first!.name, name: Storage.parents.first!.name, birth: Storage.parents.first!.birth, photo: Storage.parents.first!.photo)
        
        let anaChat = Chat(contact: ana, messages: [
            Message(sender: ana, sentDate: Date().yesterday.adding(.minute, value: -20), text:
                "Oi! Já dei o remédio da tosse pra Aurora"
                ),
            Message(sender: myself, sentDate: Date().yesterday.adding(.minute, value: -16), text:
                "Ótimo 😄"
                ),
            Message(sender: myself, sentDate: Date().yesterday.adding(.minute, value: -15), text:
                "Como ela está?"
                ),
            Message(sender: ana, sentDate: Date().yesterday, text:
                "Ela está ótima. Não teve tosse hoje."
                )
            ])
        
        let micheleChat = Chat(contact: michele, messages: [
            Message(sender: myself, sentDate: Date().yesterday.adding(.minute, value: -6), text:
                "Olá Michele, pode falar?"
                ),
            Message(sender: michele, sentDate: Date().yesterday.adding(.minute, value: -5), text:
                "Olá"
                ),
            Message(sender: michele, sentDate: Date().yesterday.adding(.minute, value: -4), text:
                "Claro, estou à disposição."
                ),
            Message(sender: myself, sentDate: Date().yesterday.adding(.minute, value: -3), text:
                "Gostaria de parabenizar a Escola pela adesão do app maya. Estou me sentindo mais segura em saber informações sobre a minha filha durante o dia."
                ),
            Message(sender: myself, sentDate: Date().yesterday.adding(.minute, value: -2), text:
                "Essa ferramenta vai ajudar muito na comunicação com a Escola e os professores também! Adorei"
                ),
            Message(sender: michele, sentDate: Date().yesterday.adding(.minute, value: -1), text:
                "Obrigada. Também estamos adorando o app!"
                ),
            Message(sender: michele, sentDate: Date().yesterday, text:
                "😄"
                )
            ])
        
        chats.append(anaChat)
        chats.append(micheleChat)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MessagesViewController: UITableViewDelegate {
    
}

extension MessagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let chat = chats[indexPath.row]
        
        cell.textLabel?.text = chat.contact.displayName
        cell.detailTextLabel?.text = chat.messages.last?.text
        cell.imageView?.image = UIImage(named: chat.contact.photo)
        cell.imageView?.cornerRadius = 22.5
        
        return cell
    }
    
    
}
