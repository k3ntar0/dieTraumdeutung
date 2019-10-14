//
//  LogInViewController.swift
//  dieTraumdeutung
//
//  Created by k3ntar0 on 2019/10/14.
//  Copyright © 2019 k3ntar0. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElement()
    }
    
    func setUpElement() {
        
        // Hide the error lable
        errorLabel.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(logInButton)
    }
    
    @IBAction func logInTapped(_ sender: Any) {
    }
    
}
