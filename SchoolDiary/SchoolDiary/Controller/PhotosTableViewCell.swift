//
//  PhotosTableViewCell.swift
//  SchoolDiary
//
//  Created by Marcus Vinicius Vieira Badiale on 10/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

extension UIView {
    var parentViewController: UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.parentViewController
        } else {
            return nil
        }
    }
}

class PhotosTableViewCell: UITableViewCell {

    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    var section : Section!
    var diary : Diary!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let flow: UICollectionViewFlowLayout = photosCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        photosCollectionView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        
    }
}


extension PhotosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let imageTest = diary.pictures[indexPath.row]
        parentViewController?.performSegue(withIdentifier: "photoInfo", sender: imageTest)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diary.pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhothoCollectionViewCell
        
        cell.photoImageView.image = UIImage(named: "\(self.diary.pictures[indexPath.row].image)")
        
        return cell
    }
    
}

