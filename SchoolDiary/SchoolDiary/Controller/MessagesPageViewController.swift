//
//  MessagesPageViewController.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 10/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class MessagesPageViewController: UIViewController {
    
    @IBOutlet weak var paneSelector: UISegmentedControl!
    @IBOutlet weak var noticesContainer: UIView!
    @IBOutlet weak var messagesContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        paneSelector.selectedSegmentIndex = 0
        messagesContainer.isHidden = true
        
        paneSelector.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13)], for: .selected)
    }
    
    @IBAction func switchPane(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            messagesContainer.isHidden = true
            noticesContainer.isHidden = false
        } else {
            messagesContainer.isHidden = false
            noticesContainer.isHidden = true
        }
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
