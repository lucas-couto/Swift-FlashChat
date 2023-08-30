  //
  //  RegisterViewController.swift
  //  Flash Chat iOS13
  //
  //  Created by Angela Yu on 21/10/2019.
  //  Copyright © 2019 Angela Yu. All rights reserved.
  //

import UIKit
import Firebase

class RegisterViewController: UIViewController {
  
  @IBOutlet weak var emailTextfield: UITextField!
  @IBOutlet weak var errorView: UIView!
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var passwordTextfield: UITextField!
  
  override func viewDidLoad() {
    errorView.isHidden = true
    errorLabel.text = ""
  }
  
  @IBAction func registerPressed(_ sender: UIButton) {
    
    if let email = emailTextfield.text, let password = passwordTextfield.text{
      Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        if let e = error {
          print(e.localizedDescription)
          self.errorView.isHidden = false
          self.errorLabel.text = e.localizedDescription
        } else {
          self.performSegue(withIdentifier: K.registerSegue, sender: self)
        }
      }
    }
    
    
  }
  
}
