//
//  ViewController.swift
//  SchoolDiary
//
//  Created by Annderson Packeiser Oreto on 29/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

enum Section : String {
    case meal = "Alimentação"
    case naps = "Sono"
    case bathroom = "Evacuação"
    case activities = "Atividades"
    case provide = "Providenciar"
    case pictures = "Fotos e Vídeos"
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellGridView = GridTableViewCell()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    //Section of Table view (each section is a cell)
    let sections : [Section] = [.meal, .naps, .bathroom, .activities, .provide, .pictures]
    
    var child : Child!
    var diary : Diary!
    
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
        
        guard let diary = child.diaries.first else {
            print("Diary not found.")
            return
        }
        
        self.diary = diary
        dayLabel.text = "\(self.diary.date.day)"
        monthLabel.text = self.diary.date.monthName()
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sections[section]
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 30))

        let headerImageView = UIImageView(frame: CGRect(x: 16, y: 0, width: 25, height: 23))
        let image: UIImage = UIImage(named: "alimentacao1x")!
        headerImageView.image = image
        headerImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        headerImageView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        
        let headerTitle: UILabel = UILabel(frame: CGRect(x: 50, y: -3, width: 200, height: 30))
        headerTitle.textColor = .black
        headerTitle.font = UIFont(name: "System", size: 18)
        headerTitle.text = Section.meal.rawValue
        
        view.addSubview(headerImageView)
        view.addSubview(headerTitle)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell") as! GridTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.count = self.diary.meals.count
            cell.section = .meal
        case 1:
            cell.count = self.diary.naps.count
            cell.section = .naps
        case 2:
            cell.count = self.diary.bathroom.count
            cell.section = .bathroom
        case 3:
            cell.count = self.diary.activities.count
            cell.section = .activities
        case 4:
            cell.count = 0
            cell.section = .provide
        case 5:
            cell.count = self.diary.pictures.count
            cell.section = .pictures
        default:
            cell.count = 6
            cell.section = .meal
        }
        cell.selectionStyle = .none
        cell.diary = self.diary
    
        return cell
    }
    



}
