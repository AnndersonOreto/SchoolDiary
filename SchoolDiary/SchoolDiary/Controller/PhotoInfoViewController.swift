//
//  PhotoInfoViewController.swift
//  SchoolDiary
//
//  Created by Marcus Vinicius Vieira Badiale on 10/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {

    @IBOutlet weak var photoInfoImageView: UIImageView!
    
    var section : Section!
    var diary : Diary!
    var recieveImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoInfoImageView.image = recieveImage
    }
    @IBAction func dismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
