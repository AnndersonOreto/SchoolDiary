//
//  MEAPAGUEPLEASEViewController.swift
//  SchoolDiary
//
//  Created by Marcus Vinicius Vieira Badiale on 13/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class MEAPAGUEPLEASEViewController: UIViewController {

    @IBOutlet weak var buttonTop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonTop.setImage(UIImage(named: "icon-more"), for: .normal)
        // Do any additional setup after loading the view.
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
