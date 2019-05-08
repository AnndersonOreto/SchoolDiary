//
//  MedicineTableViewCell.swift
//  SchoolDiary
//
//  Created by Ronald Maciel on 08/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class MedicineTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var doseLabel: UILabel!
    @IBOutlet weak var dataInicialLabel: UILabel!
    @IBOutlet weak var dataFinalLabel: UILabel!
    @IBOutlet weak var horarioLabel: UILabel!
    
    // Editable variables
    @IBOutlet weak var nomeLabel1: UILabel!
    @IBOutlet weak var doseLabel1: UILabel!
    @IBOutlet weak var dataInicialLabel1: UILabel!
    @IBOutlet weak var dataFinalLabel1: UILabel!
    @IBOutlet weak var horarioLabel1: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
