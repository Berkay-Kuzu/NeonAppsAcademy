//
//  ViewController.swift
//  NotificationCenterProject
//
//  Created by Berkay Kuzu on 29.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var counter = 0
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var remaningTimeLabel: UILabel!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var decryptButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(showResult(data:)), name: NSNotification.Name(rawValue: "showResult"), object: nil)
        counter = 15
        remaningTimeLabel.text = "Time : \(counter)"
    }
    
    @objc func timerFunction() {
        if counter > 0 {
            remaningTimeLabel.text = "Your Remaning Time : \(counter)"
            counter -= 1
        } else if counter == 0 {
            remaningTimeLabel.text = "Time is Over!"
            counter -= 1
        }
    }
    
    @objc func showResult(data: Notification) {
        if let userInfo = data.userInfo {
            let result = userInfo["result2"] as! String
            self.passwordLabel.text = "Your Password : \(String(result))"
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.passwordLabel.text = ""
            }
        }
    }

    @IBAction func decryptButton(_ sender: UIButton) {
        decryptButtonOutlet.setTitle("Decrypting", for: .normal)
        decryptButtonOutlet.isEnabled = false

        performSegue(withIdentifier: "toSecondVC", sender: nil)

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        passwordTextfield.addTarget(self, action: #selector(enterPassword(_:)), for: .editingDidEndOnExit)

        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [weak self] timer in
                    self?.dismiss(animated: true, completion: nil)
                }
    }
    
    
    @IBAction func enterPassword(_ sender: UITextField) {
        if passwordTextfield.text == "2468" {
            makeAlert(titleInput: "Well Done!", messageInput: "You have entered the password correctly!")
            passwordTextfield.isEnabled = false
            timer.invalidate()
        } else {
            makeAlert(titleInput: "Error!", messageInput: "You entered wrong password. Please enter correct password!")
        }
    }
    
    private func makeAlert(titleInput: String, messageInput: String) {
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
}

