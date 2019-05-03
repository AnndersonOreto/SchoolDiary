//
//  GridTableViewCell.swift
//  SchoolDiary
//
//  Created by Marcus Vinicius Vieira Badiale on 02/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class GridTableViewCell: UITableViewCell {

    
    struct ItemTeste {
        var name: String
    }
    
    @IBOutlet weak var GridView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    // Intens of Collection view
    //    let itemsOfSection = [
    //        ["Lanche9h", "Almoço", "Lanche14h", "Pré-Janta", "Leite9h", "Leite17h30"],
    //        ["manhã","tarde"],
    //        ["Xixi","Cocô"],
    //        ["Blocos de encaixe", "Balões"],
    //        ["Pomada/Assadura" ]
    //    ]
    
    var items: [ItemTeste] = [
        ItemTeste(name: "1"),
        ItemTeste(name: "2"),
        ItemTeste(name: "3"),
        ItemTeste(name: "4"),
        ItemTeste(name: "5"),
        ItemTeste(name: "6"),
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewHeightConstraint.constant = CGFloat(130.0) * CGFloat(1 + (items.count - 1)/3)
        backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        GridView.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        GridView.dataSource = self
        GridView.delegate = self
    }
}

extension GridTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "gridCell", for: indexPath)
        
        cell.contentView.layer.cornerRadius = 2.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: -2, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.2
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
}


