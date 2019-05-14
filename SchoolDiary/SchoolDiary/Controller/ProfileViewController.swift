//
//  ProfileViewController.swift
//  SchoolDiary
//
//  Created by Marcus Vinicius Vieira Badiale on 14/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var parentNameLabel: UILabel!
    var section : Section!
    var child : Child!
    var diary : Diary!
    var childParent: Parent!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        guard let childParent = Storage.parents.first else {
            print("Parent not found.")
            return
        }
        
        self.childParent = childParent
        parentNameLabel.text = self.childParent.name
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }

}
