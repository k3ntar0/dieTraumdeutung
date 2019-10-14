//
//  LogInViewController.swift
//  dieTraumdeutung
//
//  Created by k3ntar0 on 2019/10/14.
//  Copyright © 2019 k3ntar0. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements() {
        
        // Hide the error lable
        errorLabel.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(logInButton)
    }
    
    @IBAction func logInTapped(_ sender: Any) {
        
        // Create cleaned versions of the data
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
        // Sign in
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            // Check for errors
            if error != nil {
                // Show error message
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            } else {
                // Signed in successfully
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as?
                HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
}
