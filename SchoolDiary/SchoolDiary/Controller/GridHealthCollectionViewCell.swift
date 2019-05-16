//
//  GridHealthCollectionViewCell.swift
//  SchoolDiary
//
//  Created by Ronald Maciel on 07/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit
import TinyConstraints

class GridHealthCollectionViewCell: UICollectionViewCell {
    
    var picker = UIPickerView()
    var child: Child!
    
    var integerPart = Array(0...100)
    var decimalPart = [".0", ".1", ".2",".3",".4",".5",".6",".7",".8",".9"]

    
    static var id = 0
    var id2 = 0
    

    @IBOutlet weak var measureImageView: UIImageView!
    @IBOutlet weak var measureLabel: UILabel!
    @IBOutlet weak var measureTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if GridHealthCollectionViewCell.id < 2 {
            picker.dataSource = self
            picker.delegate = self
            measureTextField.inputView = picker
            self.createToolBar()
        }
        
        id2 = GridHealthCollectionViewCell.id
        GridHealthCollectionViewCell.id += 1
        
        measureTextField.delegate = self
        
        
    }
    


    // Func responsible for allow any change in the Allergic Section
    @IBAction func textFieldEditingDidChange(_ sender: Any) {
        if id2 == 2{
            measureTextField.text = "\(child.allergies.count)"

        }
    }
    

}

extension GridHealthCollectionViewCell: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if id2 == 2 {
            
            (parentViewController as? HealthViewController)?.alergia.isHidden = false
            
            (self.parentViewController as? HealthViewController)?.alergia.keyboardHeight.constant = 0
            (self.parentViewController as? HealthViewController)?.view.layoutIfNeeded()
            
            
            //animation of the allergic view
            UIView.animate(withDuration: 0.25, animations: {
                (self.parentViewController as? HealthViewController)?.alergia.keyboardHeight.constant = 335
                (self.parentViewController as? HealthViewController)?.view.layoutIfNeeded()
            }) { (_) in
                (self.parentViewController as? HealthViewController)?.alergia.alergiasTextField.becomeFirstResponder()
            }
            

            (parentViewController as? HealthViewController)?.tabBarController?.tabBar.isHidden = true
            
            
            
            
            
            
            
        }
    } 
    
}

extension GridHealthCollectionViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return integerPart.count
        } else if component == 1 {
            return decimalPart.count
        } else {
            return 1
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "\(integerPart[row])"
        } else if component == 1 {
            return "\(decimalPart[row])"
        } else if component == 3 {
            if id2 == 0 {
                return "kg"
            } else {
                return "cm"
            }
        } else {
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if measureTextField.isFirstResponder {
            if id2 == 0 {
                measureTextField.text = "\(integerPart[pickerView.selectedRow(inComponent: 0)])\(decimalPart[pickerView.selectedRow(inComponent: 1)])kg"
            } else {
                measureTextField.text = "\(integerPart[pickerView.selectedRow(inComponent: 0)])\(decimalPart[pickerView.selectedRow(inComponent: 1)])cm"
            }
        }
    }
    
    func createToolBar() {
        picker.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        

        if measureTextField.inputAccessoryView == nil {
            let toolBar = UIToolbar()
            toolBar.barStyle = .default
            toolBar.isTranslucent = true
            toolBar.sizeToFit()
            toolBar.layer.borderWidth = 0.5
            toolBar.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
            toolBar.clipsToBounds = true
            
            
            
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
            
            
            
            let titleForMeasureEditing = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            titleForMeasureEditing.text = "Text in toolbar"
            titleForMeasureEditing.textColor = #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
            titleForMeasureEditing.font = UIFont(name: "System", size: 20)
            titleForMeasureEditing.sizeToFit()
            titleForMeasureEditing.textColor = .black
            titleForMeasureEditing.textAlignment = NSTextAlignment.center
            
            
            
            if GridHealthCollectionViewCell.id == 0 {
                // create the title for the weight measure
                
                titleForMeasureEditing.text = "Editar peso"
                let toolBarTitle = UIBarButtonItem(customView: titleForMeasureEditing)
                toolBar.setItems([cancelButton, spaceButton,toolBarTitle, spaceButton, doneButton], animated: true)

            } else {
                // create the title for the height measure
                titleForMeasureEditing.text = "Editar altura"
                let toolBarTitle = UIBarButtonItem(customView: titleForMeasureEditing)
                toolBar.setItems([cancelButton, spaceButton,toolBarTitle, spaceButton, doneButton], animated: true)
            }
            
            toolBar.isUserInteractionEnabled = true
            toolBar.setNeedsLayout()
            measureTextField.inputAccessoryView = toolBar
            
        }
    }
    
    @objc func doneClick() {
        endEditing(true)
    }
    @objc func cancelClick() {
        endEditing(true)
    }
    
    
}
