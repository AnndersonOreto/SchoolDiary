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
        tableView.tableHeaderView?.backgroundColor = #colorLiteral(red: 0.9750739932, green: 0.9750967622, blue: 0.9750844836, alpha: 1)
        
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
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 30))
        
        if section == 0 {
            let headerImageView = UIImageView(frame: CGRect(x: (self.view.bounds.size.width/2) - 55, y: 18, width: 23, height: 21))
            var image: UIImage
            
            let headerBirthDateTitle: UILabel = UILabel(frame: CGRect(x: (self.view.bounds.size.width / 2) - 25, y: 13, width: 200, height: 30))
            headerBirthDateTitle.textColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
            headerBirthDateTitle.font = UIFont(name: "System", size: 13)
            
            let headerAgeTitle: UILabel = UILabel(frame: CGRect(x: (self.view.bounds.size.width / 2) - 60 , y: -8, width: 200, height: 30))
            headerAgeTitle.textColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
            headerAgeTitle.font = UIFont(name: "System-bold", size: 14)
            
            headerAgeTitle.text = "\(2019 - child.birth.year) anos e \(child.birth.month > 5 ? 7 + child.birth.month : 5 - child.birth.month) meses"
            headerBirthDateTitle.text = "\(child.birth.day)/\(child.birth.month)/\(child.birth.year)"
            
            image = UIImage(named: "aniversario")!
            view.addSubview(headerBirthDateTitle)
            view.addSubview(headerAgeTitle)
            
            headerImageView.image = image
            headerImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
            headerImageView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
            
            view.addSubview(headerImageView)
            
        } else if section == 1 {
            let headerImageView = UIImageView(frame: CGRect(x: 16, y: -6, width: 25, height: 23))
            var image: UIImage
            
            let headerMedicationTitle: UILabel = UILabel(frame: CGRect(x: 44, y: -10, width: 200, height: 30))
            headerMedicationTitle.textColor = #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
            headerMedicationTitle.font = UIFont(name: "System", size: 18)
            
            headerMedicationTitle.text = "Medicamentos"
            image = UIImage(named: "medicamentosSectionHeader")!
            
            view.addSubview(headerMedicationTitle)
            headerImageView.image = image
            headerImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
            headerImageView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
            
            view.addSubview(headerImageView)
        }
        
        return view
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let numberOfItemsInSection = 3
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "StatusHealthCell") as! GridHealthTableViewCell
            
            cell.count =  numberOfItemsInSection
            cell.section = .measures
            cell.child = child
            cell.selectionStyle = .none
            cell.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
            
            return cell

        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell") as! MedicineTableViewCell
            
            cell.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
            
            cell.medicineView.frame.size.height = 88
            cell.medicineView.layer.cornerRadius = 15.0
            cell.medicineView.layer.borderWidth = 3.0
            cell.medicineView.layer.borderColor = UIColor.clear.cgColor
            cell.medicineView.layer.masksToBounds = true
            
            cell.medicineView.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.medicineView.layer.shadowOffset = CGSize(width: 1, height: 1.0)
            cell.medicineView.layer.shadowRadius = 6.0
            cell.medicineView.layer.shadowOpacity = 1
            cell.medicineView.layer.masksToBounds = false
            cell.medicineView.layer.shadowPath = UIBezierPath(roundedRect: cell.medicineView.bounds, cornerRadius: cell.medicineView.layer.cornerRadius).cgPath
            cell.medicineView.dropShadow(color: #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1) , opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)

            
            cell.nomeLabel.text = "nome"
            cell.doseLabel.text = "dose"
            cell.nomeLabel1.text = "teste1"
            cell.doseLabel1.text = "teste2"
            cell.dataInicialLabel.isHidden = true
            cell.dataInicialLabel1.isHidden = true
            cell.dataFinalLabel.isHidden = true
            cell.dataFinalLabel1.isHidden = true
            cell.horarioLabel.isHidden = true
            cell.horarioLabel1.isHidden = true
            
            return cell

        } else {
            fatalError()
        }

    }
    
    
    

    
}

