//
//  MainTabBarViewController.swift
//  UIViewAnimations
//
//  Created by Berkay Kuzu on 27.06.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainTabBarSetup()
        
        
    }

    private func mainTabBarSetup() {
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: FourthViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "rotate.3d")
        vc2.tabBarItem.image = UIImage(systemName: "rotate.3d")
        vc3.tabBarItem.image = UIImage(systemName: "rotate.3d")
        vc4.tabBarItem.image = UIImage(systemName: "rotate.3d")
        
        vc1.title = "First"
        vc2.title = "Second"
        vc3.title = "Third"
        vc4.title = "Fourth"
        
        tabBar.tintColor = .purple
        tabBar.barTintColor = .red
        tabBar.unselectedItemTintColor = .red

        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true
        tabBar.layer.opacity = 0.8
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
    
}

