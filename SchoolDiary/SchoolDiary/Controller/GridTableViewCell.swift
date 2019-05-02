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
        GridView.backgroundColor = .lightGray
        collectionViewHeightConstraint.constant = CGFloat(130.0) * CGFloat(1 + (items.count - 1)/3)
        GridView.dataSource = self
        GridView.delegate = self
    }
}

extension GridTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "teste", for: indexPath)
        return cell
    }
}


