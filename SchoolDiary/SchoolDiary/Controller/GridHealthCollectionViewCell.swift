//
//  GridHealthCollectionViewCell.swift
//  SchoolDiary
//
//  Created by Ronald Maciel on 07/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class GridHealthCollectionViewCell: UICollectionViewCell {
    
    var picker = UIPickerView()
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
    }
    
    @IBAction func textFieldEditingDidChange(_ sender: Any) {
        if id2 < 2 {
            measureTextField.text = measureTextField.text?.components(separatedBy: " ")[0]
            if id2 == 0 {
                measureTextField.text = "\(measureTextField.text ?? "") kg"
            } else {
                measureTextField.text = "\(measureTextField.text ?? "") cm"
            }
        }
    }
    
}

extension GridHealthCollectionViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return integerPart.count
        } else {
            return decimalPart.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "\(integerPart[row])"
        } else {
            return "\(decimalPart[row])"
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if measureTextField.isFirstResponder {
            var intPart = ""
            var decPart = ""
            
            if component == 0 {
                intPart = "\(integerPart[row])"
            }
            
            if component == 1 {
                decPart = decimalPart[row]
            }
            measureTextField.text = "\(intPart)\(decPart)"
        }
    }
    
    func createToolBar() {
        if measureTextField.inputAccessoryView == nil {
            let toolBar = UIToolbar()
            toolBar.barStyle = .default
            toolBar.isTranslucent = true
            toolBar.sizeToFit()
            
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
            toolBar.isUserInteractionEnabled = true
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
