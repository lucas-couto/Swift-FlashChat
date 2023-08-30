  //
  //  LoginViewController.swift
  //  Flash Chat iOS13
  //
  //  Created by Angela Yu on 21/10/2019.
  //  Copyright © 2019 Angela Yu. All rights reserved.
  //

import UIKit
import Firebase

class LoginViewController: UIViewController {
  
  @IBOutlet weak var emailTextfield: UITextField!
  @IBOutlet weak var errorView: UIView!
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var passwordTextfield: UITextField!
  
  override func viewDidLoad() {
    errorView.isHidden = true
    errorLabel.text = ""
  }
  
  @IBAction func loginPressed(_ sender: UIButton) {
    if let email = emailTextfield.text, let password = passwordTextfield.text {
      Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
        guard let strongSelf = self else { return }
        if let e = error {
          self?.errorView.isHidden = false
          self?.errorLabel.text = e.localizedDescription
        } else {
          self?.performSegue(withIdentifier: K.loginSegue, sender: self)
        }
      }
    }
    
    
  }
  
}
