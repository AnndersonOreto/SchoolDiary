//
//  ActivitiesTableViewCell.swift
//  SchoolDiary
//
//  Created by Marcus Vinicius Vieira Badiale on 09/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var activitiesCollectionView: UICollectionView!
    
    
    var count = 0
    var section : Section!
    var diary : Diary!
    
    
    func configure() {
        backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        let flow: UICollectionViewFlowLayout = activitiesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        activitiesCollectionView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        activitiesCollectionView.delegate = self
        activitiesCollectionView.dataSource = self
        activitiesCollectionView.reloadData()
    }
    
    

}

extension ActivitiesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        if collectionView.frame.size.width < 290 {
//            return CGSize(width: collectionView.frame.size.width*0.30, height: 124)
//        }
//        return CGSize(width: collectionView.frame.size.width*0.31, height: 124)
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch self.section as Section {
        case .activities:
            return diary.activities.count
        case .provide:
            return diary.provide.count
        default:
            break
        }
        return diary.activities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "activitiesCell", for: indexPath) as! ActivitiesCollectionViewCell
        
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
        
        var image: UIImage

        switch section as Section {
        case .activities:
            cell.activitiesLabel.text = self.diary.activities[indexPath.row].description
            switch self.diary.activities[indexPath.row].type{
            case .classes:
                image = UIImage(named: "blocos")!
            case .storytelling:
                image = UIImage(named: "diaryclicked")!
            case .games:
                image = UIImage(named: "baloes")!
            case .other:
                image = UIImage(named: "saudeclicked1x")!
            }
            cell.activitiesImage.image = image
        case .provide:
            cell.activitiesLabel.text = self.diary.provide[indexPath.row].description
            cell.activitiesImage.image = UIImage(named: "pomada")
        default:
            break
        }
        
        return cell
    }
    
}
