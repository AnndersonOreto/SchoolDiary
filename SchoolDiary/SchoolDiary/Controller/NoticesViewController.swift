//
//  NoticesViewController.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 10/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class NoticesViewController: UIViewController {

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
        tableView.clipsToBounds = false
        tableView.row
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
        return Storage.notices.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        let noticeDates = Storage.notices.filter
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeCell") as! NoticeTableViewCell
        
        let notice = Storage.notices[indexPath.row]
        cell.titleLabel.text = notice.title.uppercased()
        cell.typeLabel.text = notice.type.rawValue
        cell.noticeText.text = notice.text
        
        cell.layer.cornerRadius = 15
        cell.layer.shadowRadius = 20
        cell.layer.shadowOpacity = 0.1
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    
}

extension NoticesViewController : UITableViewDelegate {
    
}
