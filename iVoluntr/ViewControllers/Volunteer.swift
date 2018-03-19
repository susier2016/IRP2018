//
//  Volunteer.swift
//  iVoluntr
//
//  Created by Susie Renjith on 12/28/17.
//  Copyright © 2017 Susie Renjith. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class Volunteer: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var DOBTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    var username = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    
    @IBAction func submitButton(_ sender: Any) {
        
        if (nameTextField.text == "" || DOBTextField.text == "" || emailTextField.text == "" || passwordTextField.text == "" || repeatPasswordTextField.text == "") {
            let alert = UIAlertController(title: "", message: "All Text Fields are Required", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            if (passwordTextField.text == repeatPasswordTextField.text) {
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user.")
                    if error != nil {
                        print("Hey, we have an error! \(String(describing: error))")
                    } else {
                        let alert = UIAlertController(title: "Verify your Email", message: "Check Your Email for a Verification Message", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        user?.sendEmailVerification(completion: nil)
                    }
                })
            } else {
                let alert = UIAlertController(title: "", message: "Passwords do not Match", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)            }
        }
    }
}


