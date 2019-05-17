//
//  NoticeTableViewCell.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 09/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

@IBDesignable
class NoticeTableViewCell: UITableViewCell {

    @IBOutlet weak var typeRibbon: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var noticeText: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var labelMask: UIView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelView.mask = labelMask
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = #colorLiteral(red: 0.9685191512, green: 0.9686883092, blue: 0.9685210586, alpha: 1)
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
