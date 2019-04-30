//
//  ViewController.swift
//  SchoolDiary
//
//  Created by Annderson Packeiser Oreto on 29/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    let sections = ["Alimentação", "Sono", "Evacuação", "Atividades", "Providenciar", "Fotos/ Vídeos"]
    
    let itemsOfSection = [
        ["Lanche9h", "Almoço", "Lanche14h", "Pré-Janta", "Leite9h", "Leite17h30"],
        ["manhã","tarde"],
        ["Xixi","Cocô"],
        ["Blocos de encaixe", "Balões"],
        ["Pomada/Assadura" ]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsOfSection[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = itemsOfSection[indexPath.section][indexPath.row]
        
        return cell
    }
    



}
