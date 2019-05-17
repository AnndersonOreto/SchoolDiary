//
//  LoginController.swift
//  SchoolDiary
//
//  Created by Annderson Packeiser Oreto on 02/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation
import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        let login = Storage.parents.first?.email
        let password = Storage.parents.first?.password
        
        if nameTextField.text == login && passwordTextField.text == password {
            performSegue(withIdentifier: "goToBackbone", sender: sender)
        }
        
    }
    
}
