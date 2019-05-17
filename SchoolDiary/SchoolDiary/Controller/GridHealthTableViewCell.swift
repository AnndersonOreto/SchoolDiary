//
//  GridHealthTableViewCell.swift
//  SchoolDiary
//
//  Created by Ronald Maciel on 07/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class GridHealthTableViewCell: UITableViewCell {
    @IBOutlet weak var GridView: UICollectionView!
    

    var section: Sections!

    var child: Child!
    var count = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        container.
        
        let flow: UICollectionViewFlowLayout = GridView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        GridView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        GridView.dataSource = self
        GridView.delegate = self

    }

}


extension GridHealthTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.frame.size.width < 290 {
            return CGSize(width: collectionView.frame.size.width*0.30, height: 124)
        }
        return CGSize(width: collectionView.frame.size.width*0.31, height: 124)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "gridMeasureCell", for: indexPath) as! GridHealthCollectionViewCell
        
        
        cell.contentView.layer.cornerRadius = 15.0
        cell.contentView.layer.borderWidth = 3.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
        cell.layer.shadowOffset = CGSize(width: 1, height: 1.0)
        cell.layer.shadowRadius = 6.0
        cell.layer.shadowOpacity = 1
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        switch section as Sections {
            
        case .measures:
            cell.child = child
            if indexPath.row == 0 {
                cell.measureLabel.text = "Peso"
                cell.measureImageView.image = UIImage(named: "peso")!
                cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else if indexPath.row == 1 {
                cell.measureLabel.text = "Altura"
                cell.measureImageView.image = UIImage(named: "altura")!
                cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else if indexPath.row == 2 {
                cell.measureLabel.text = "Alergia"
                cell.measureImageView.image = UIImage(named: "alergia")!
                cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

            } else {
                fatalError()
            }
            
        default:
            break
        }
        
        return cell
    }

}
