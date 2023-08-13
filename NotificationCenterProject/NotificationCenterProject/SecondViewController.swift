//
//  SecondViewController.swift
//  NotificationCenterProject
//
//  Created by Berkay Kuzu on 29.05.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var decryptingLabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.decryptingLabel.text = "Decrypting..."
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.backButton(self)
        }
        
    }
}
    
    @IBAction func backButton(_ sender: Any) {
        
        label1.text = "2468"
        let result2 = label1.text!
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showResult"), object: nil , userInfo: ["result2" : result2])
        self.dismiss(animated: true, completion: nil)
    }
    
}
