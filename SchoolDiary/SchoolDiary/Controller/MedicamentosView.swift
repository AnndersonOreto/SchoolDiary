//
//  MedicamentosView.swift
//  SchoolDiary
//
//  Created by Ronald Maciel on 16/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class MedicamentosView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        Bundle.main.loadNibNamed("MedicamentosView", owner: self, options: nil)
//        addSubview(contentView)
//        contentView.frame = bounds
//        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        obsTextView.textContainerInset = .zero
//        obsTextView.contentInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
//        obsTextView.text = "Observações"
//        obsTextView.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        obsTextView.delegate = self
//
//        alergiasTextField.delegate = self
//        
        
    }
}
