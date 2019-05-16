//
//  AlergiaView.swift
//  SchoolDiary
//
//  Created by Ronald Maciel on 14/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class AlergiaView: UIView {

    var child: Child!
    
    var activeField: UITextField?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var obsTextView: UITextView!
    @IBOutlet weak var alergiasTextField: UITextField!
    
    @IBOutlet weak var keyboardView: UIView!
    @IBOutlet weak var keyboardHeight: NSLayoutConstraint!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    private func initialize() {
        Bundle.main.loadNibNamed("AlergiaView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        obsTextView.textContainerInset = .zero
        obsTextView.contentInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        obsTextView.text = "Observações"
        obsTextView.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        obsTextView.delegate = self
        
    }
    
    
    
    
    
    
    @IBAction func addAlergiaButton(_ sender: Any) {
        let allergyType: AllergyType
        
        if alergiasTextField.text == "Animal"{
            allergyType = AllergyType.animal
        } else if alergiasTextField.text == "Remedio" {
            allergyType = AllergyType.medicine
        } else if alergiasTextField.text == "Comida"{
            allergyType = AllergyType.food
        } else {
            allergyType = AllergyType.other
        }
        
        let allergy = Allergy(type: allergyType, description: obsTextView.text)
        child.allergies.insert(allergy)
        alergiasTextField.text = ""
        obsTextView.text = "Observações"
        obsTextView.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    
    
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.isHidden = true
        alergiasTextField.text = ""
        obsTextView.text = "Observações"
        obsTextView.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        (parentViewController as? HealthViewController)?.tabBarController?.tabBar.isHidden = false
        endEditing(true)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        self.isHidden = true
        alergiasTextField.text = ""
        obsTextView.text = "Observações"
        obsTextView.textColor = #colorLiteral(red: 0.9750739932, green: 0.9750967622, blue: 0.9750844836, alpha: 1)
        (parentViewController as? HealthViewController)?.tabBarController?.tabBar.isHidden = false
        (parentViewController as? GridHealthCollectionViewCell)?.measureTextField.text = "\(child.allergies.count)"
        (parentViewController as? GridHealthCollectionViewCell)?.child = child
        
        
        endEditing(true)
    }
    


}

extension AlergiaView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        obsTextView.text = ""
        obsTextView.textColor = #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
    }
    
    
}




