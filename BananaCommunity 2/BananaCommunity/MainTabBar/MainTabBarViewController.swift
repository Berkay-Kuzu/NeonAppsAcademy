//
//  MainTabBarViewController.swift
//  BananaCommunity
//
//  Created by Berkay Kuzu on 23.06.2023.
//

import UIKit

class MainTabBarTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainTabBarSetup()
    }

    private func mainTabBarSetup() {
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UploadViewController())
        let vc3 = UINavigationController(rootViewController: SettingsViewController())
    
        
        vc1.tabBarItem.image = UIImage(systemName: "h.square.fill")
        vc2.tabBarItem.image = UIImage(systemName: "u.square.fill")
        vc3.tabBarItem.image = UIImage(systemName: "s.square.fill")
        
        vc1.title = "Home"
        vc2.title = "Upload"
        vc3.title = "Settings"
        
        tabBar.tintColor = .systemYellow
        tabBar.barTintColor = .white
        tabBar.unselectedItemTintColor = .black

        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true
        tabBar.layer.opacity = 0.8
        
        setViewControllers([vc1, vc2, vc3], animated: true)
        
        self.delegate = self
        tabBar.accessibilityIdentifier = "tabBar"
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
            return false
        }
        if fromView != toView {
            UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
                fromView.removeFromSuperview()
                self.view.addSubview(toView)
            }, completion: nil)
        }
        return true
    }
}
