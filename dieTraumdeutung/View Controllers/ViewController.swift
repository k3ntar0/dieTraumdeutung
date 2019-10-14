//
//  ViewController.swift
//  dieTraumdeutung
//
//  Created by k3ntar0 on 2019/10/14.
//  Copyright © 2019 k3ntar0. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElement()
    }
    
    func setUpElement() {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(logInButton)
    }


}

