//
//  MainTabBarViewController.swift
//  TabBar Controller
//
//  Created by Berkay Kuzu on 5.06.2023.
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
        let vc4 = UINavigationController(rootViewController: ForthViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "figure.walk")
        vc2.tabBarItem.image = UIImage(systemName: "figure.run")
        vc3.tabBarItem.image = UIImage(systemName: "figure.core.training")
        vc4.tabBarItem.image = UIImage(systemName: "figure.dance")
        
        vc1.title = "Walk"
        vc2.title = "Run"
        vc3.title = "Training"
        vc4.title = "Dance"
        
        tabBar.tintColor = .blue
        tabBar.barTintColor = .red
        tabBar.unselectedItemTintColor = .red

        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true
        tabBar.layer.opacity = 0.8
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
    
}

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
}

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
    }
}

class ForthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
}
