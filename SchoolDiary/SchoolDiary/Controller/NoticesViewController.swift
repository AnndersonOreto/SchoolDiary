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
        tableView.rowHeight = 116
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
        switch notice.type {
        case .administrative:
            cell.typeRibbon.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.6392156863, blue: 0.631372549, alpha: 1)
        case .finance:
            cell.typeRibbon.backgroundColor = #colorLiteral(red: 0.7450980392, green: 0.7215686275, blue: 0.8901960784, alpha: 1)
        case .secretary:
            cell.typeRibbon.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.8392156863, blue: 0.4392156863, alpha: 1)
        case .health:
            cell.typeRibbon.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.7490196078, blue: 0.6549019608, alpha: 1)
        case .pedagogy:
            cell.typeRibbon.backgroundColor = #colorLiteral(red: 0.5960784314, green: 0.7647058824, blue: 0.8745098039, alpha: 1)
        }
        cell.noticeText.text = notice.text
        
        cell.frame = cell.containerView.frame
        cell.layer.backgroundColor = #colorLiteral(red: 0.9685191512, green: 0.9686883092, blue: 0.9685210586, alpha: 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = self.sections[indexPath.section]
        let notice = section.notices[indexPath.row]
        
        let alertController = UIAlertController(title: notice.title.uppercased(), message: notice.text, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Fechar", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Enviar mensagem", style: .default))
        
        self.present(alertController, animated: true, completion: {
            tableView.deselectRow(at: indexPath, animated: true)
        })
    }
    
    
}

extension NoticesViewController : UITableViewDelegate {
    
}
