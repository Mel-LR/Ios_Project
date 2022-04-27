//
//  ViewController.swift
//  Ios_Project
//
//  Created by Mélyne LERAY on 26/04/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func connectButton(_ sender: Any) {
        if nameTextField.text == "ok" && passwordTextField.text == "ok" {
            print("OK ok")
            
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "home") as? HomeViewController {
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            print("non")
        }
    }
}

