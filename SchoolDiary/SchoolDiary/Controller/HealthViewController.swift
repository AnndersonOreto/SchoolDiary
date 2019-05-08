//
//  HealthViewController.swift
//  SchoolDiary
//
//  Created by Ronald Maciel on 07/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

enum Sections {
    case measures
    case medicines
}

class HealthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let cellGridView = GridHealthTableViewCell()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    let section: [Sections] = [.measures, .medicines]
    var child: Child!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = Storage()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        tableView.tableHeaderView?.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        
        guard let child = Storage.children.first else {
            print("Child not found.")
            return
        }
        
        
        self.child = child
        nameLabel.text = self.child.name
        

        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return section.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return child.medicines.count
        }
        
        
        
        
        
        
//        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 30))
        
        let headerImageView = UIImageView(frame: CGRect(x: 16, y: 0, width: 25, height: 23))
        var image: UIImage = UIImage(named: "alimentacao1x")!
        
        let headerTitle: UILabel = UILabel(frame: CGRect(x: 50, y: -3, width: 200, height: 30))
        headerTitle.textColor = .black
        headerTitle.font = UIFont(name: "System", size: 18)
        
        
        if section == 0 {
            headerTitle.text = "teste1"
            image = UIImage(named: "alimentacao1x")!
        } else if section == 1 {
            headerTitle.text = "Medicamentos"
            image = UIImage(named: "alimentacao1x")!
        }
        
        
        
        return view
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "StatusHealthCell") as! GridHealthTableViewCell
            
            cell.count = 3
            cell.section = .measures
            cell.child = child
            cell.selectionStyle = .none
            
            return cell

        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell") as! MedicineTableViewCell
            
            return cell

        } else {
            fatalError()
        }

    }
    
    
    

    
}

