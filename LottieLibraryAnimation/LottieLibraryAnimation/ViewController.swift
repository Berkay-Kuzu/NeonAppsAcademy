//
//  ViewController.swift
//  LottieLibraryAnimation
//
//  Created by Berkay Kuzu on 12.06.2023.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    var animationView = LottieAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupAnimation()
        navigationController?.navigationBar.tintColor = .black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animationView.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.animationView.stop()
            self.animationView.removeFromSuperview()
            let vc = SecondViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func setupAnimation() {
        animationView = LottieAnimationView(name: "97952-loading-animation-blue")
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        //animationView.play()
        view.addSubview(animationView)
    }
    
}

