//
//  NoticesViewController.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 10/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

struct NoticeSection : Comparable {
    static func < (lhs: NoticeSection, rhs: NoticeSection) -> Bool {
        return lhs.day < rhs.day
    }
    
    var day : Date
    var notices : [Notice] = []
}

class NoticesViewController: UIViewController {

    var sections = [NoticeSection]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "NoticeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NoticeCell")
        tableView.rowHeight = 106
        tableView.superview?.backgroundColor = #colorLiteral(red: 0.9685191512, green: 0.9686883092, blue: 0.9685210586, alpha: 1)
        
        let groups = Dictionary(grouping: Storage.notices) { (notice) in
            return notice.date.beginning(of: .day)!
        }
        
        sections = groups.map(NoticeSection.init(day:notices:)).sorted().reversed()
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

extension NoticesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].notices.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        let noticeDates = Storage.notices.filter
        
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sections[section]
        let date = section.day
        
        if date.isInToday {
            return "Hoje"
        } else if date.isInYesterday {
            return "Ontem"
        } else {
            return date.string(withFormat: "dd/MM/yyyy")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeCell") as! NoticeTableViewCell
        
        let section = self.sections[indexPath.section]
        let notice = section.notices[indexPath.row]
        
        cell.titleLabel.text = notice.title.uppercased()
        cell.typeLabel.text = notice.type.rawValue
        cell.noticeText.text = notice.text
        
        cell.frame = cell.contentView.frame
        
        cell.layer.cornerRadius = 15
        cell.layer.shadowRadius = 20
        cell.layer.shadowOpacity = 0.1
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    
}

extension NoticesViewController : UITableViewDelegate {
    
}
