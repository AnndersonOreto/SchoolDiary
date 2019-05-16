//
//  SecurityViewController.swift
//  SchoolDiary
//
//  Created by Marcus Vinicius Vieira Badiale on 15/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class SecurityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var responsable: Parent!
    var child: Child!
    
    @IBOutlet weak var securityTableView: UITableView!
    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let child = Storage.children.first else{
            print("Child not found.")
            return
        }
        guard let responsable = Storage.parents.first else {
            print("Parent not found.")
            return
        }
        self.responsable = responsable
        self.child = child
        
        securityTableView.delegate = self
        securityTableView.dataSource = self
        securityTableView.separatorStyle = .none
        securityTableView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        headerLabel.text = "Quem pode buscar \(child.name)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "securityCell") as! SecurityTableViewCell
        
        cell.responsableNameLabel.text = self.responsable.name
        cell.responsableCpfLabel.text = "\(self.responsable.cpf)"
        cell.responsablePhoneLabel.text = "\(self.responsable.phone)"
        cell.responsableTypeLabel.text = self.responsable.relationship.rawValue
        cell.responsableEmailLabel.text = self.responsable.email
        
        cell.selectionStyle = .none
        
        return cell
    }

}
