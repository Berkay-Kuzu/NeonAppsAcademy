//
//  ViewController.swift
//  DreamDestinations
//
//  Created by Berkay Kuzu on 28.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var boolTextField: UITextField!
    @IBOutlet weak var intTextField: UITextField!
    @IBOutlet weak var stringTextField: UITextField!
    
    
    @IBOutlet weak var boolLabel: UILabel!
    @IBOutlet weak var intLabel: UILabel!
    @IBOutlet weak var stringLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        boolTextField.placeholder = "Please write only true or false"
        intTextField.placeholder = "Please enter a number"
        stringTextField.placeholder = "Please enter the place you visited"
        
        configureUserDefaults()
    }
    
    private func configureUserDefaults() {
        
        let storedBool = UserDefaults.standard.bool(forKey: "bool")
        let storedInt = UserDefaults.standard.integer(forKey: "int")
        let storedString = UserDefaults.standard.string(forKey: "string")
        
        boolLabel.text = "Have you been there before? : \(storedBool)"
        intLabel.text =  "You visited : \(storedInt) times"
        stringLabel.text =  "The name of place you visited : \(storedString!)"
        
    }

   
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        
        UserDefaults.standard.set(boolTextField.text, forKey: "bool")
        UserDefaults.standard.set(intTextField.text, forKey: "int")
        UserDefaults.standard.set(stringTextField.text, forKey: "string")
        
        
        boolLabel.text = "Have you been there before? : \(boolTextField.text!)"
        intLabel.text = "You visited : \(intTextField.text!) times"
        stringLabel.text = "The name of place you visited : \(stringTextField.text!)"
        
    }
    
    
}

