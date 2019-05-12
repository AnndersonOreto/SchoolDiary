//
//  MyTabBarController.swift
//  SchoolDiary
//
//  Created by Marcus Vinicius Vieira Badiale on 02/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    @IBOutlet weak var myTabBar: UITabBar!
    
    let selectedImage1 = UIImage(named: "diaryclicked")?.withRenderingMode(.alwaysOriginal)
    let normalImage1 = UIImage(named: "diary1x")?.withRenderingMode(.alwaysOriginal)
    
    let selectedImage2 = UIImage(named: "messageclicked1x")?.withRenderingMode(.alwaysOriginal)
    let normalImage2 = UIImage(named: "message1x")?.withRenderingMode(.alwaysOriginal)
    
    let selectedImage3 = UIImage(named: "saudeclicked1x")?.withRenderingMode(.alwaysOriginal)
    let normalImage3 = UIImage(named: "saude1x")?.withRenderingMode(.alwaysOriginal)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var tabBarItem = self.tabBar.items![0]
        tabBarItem.selectedImage = selectedImage1
        tabBarItem.image = normalImage1
        
        tabBarItem = self.tabBar.items![1]
        tabBarItem.selectedImage = selectedImage2
        tabBarItem.image = normalImage2
        
        tabBarItem = self.tabBar.items![2]
        tabBarItem.selectedImage = selectedImage3
        tabBarItem.image = normalImage3
        
        self.selectedIndex = 0


    }
}
