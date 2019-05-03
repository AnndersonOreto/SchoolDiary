//
//  ViewController.swift
//  SchoolDiary
//
//  Created by Annderson Packeiser Oreto on 29/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let cellGridView = GridTableViewCell()
    @IBOutlet weak var tableView: UITableView!
    
    //Section of Table view (each section is a cell)
    let sections = ["Alimentação", "Sono", "Evacuação", "Atividades", "Providenciar", "Fotos/ Vídeos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
//        cell.textLabel?.text = itemsOfSection[indexPath.section][indexPath.row]
//        cell.textLabel?.text = "TEY"
        return cell
    }
    



}
