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
    
    var count = 0
    var section : Section!
    var diary : Diary!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewHeightConstraint.constant = CGFloat(130.0) * CGFloat(1 + (items.count - 1)/3)
        let flow: UICollectionViewFlowLayout = GridView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        GridView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        GridView.dataSource = self
        GridView.delegate = self
    }
}

extension GridTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "gridCell", for: indexPath) as! GridCollectionViewCell
        
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 3.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
        cell.layer.shadowOffset = CGSize(width: 1, height: 1.0)
        cell.layer.shadowRadius = 6.0
        cell.layer.shadowOpacity = 1
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        switch section as Section {
        case .meal:
            cell.mealLabel.text = self.diary.meals[indexPath.row].type.rawValue
            cell.mealTime.text = "\(self.diary.meals[indexPath.row].type.mealTime()?.hour ?? 0)h" 
            cell.mealQuantityLabel.text = self.diary.meals[indexPath.row].quantity.rawValue
            var image : UIImage
            var quantityMealImage: UIImage
            switch self.diary.meals[indexPath.row].type{ 
            case .lunch:
                image = UIImage(named: "refeicao1x")!
            case .milk:
                image = UIImage(named: "milk1x")!
            case .milk2:
                image = UIImage(named: "milk1x")!
            case .snack:
                image = UIImage(named: "icon-lanche1x")!
            case .snack2:
                image = UIImage(named: "icon-lanche1x")!
            case .preDinner:
                image = UIImage(named: "refeicao1x")!
            }
            cell.mealImage.image = image
            
            switch self.diary.meals[indexPath.row].quantity{
            case .all:
                quantityMealImage = UIImage(named: "starFull")!
            case .aLittle:
                quantityMealImage = UIImage(named: "aLittleStar1x")!
            case .half:
                quantityMealImage = UIImage(named: "halfStar")!
            case .nothing:
                quantityMealImage = UIImage(named: "star-nao-aceitou")!
            }
            cell.mealQuantityImage.image = quantityMealImage
        
        case .naps:
            break
            
            
        default:
            break
        }
        
        return cell
    }
}


