//
//  Utilities.swift
//  dieTraumdeutung
//
//  Created by k3ntar0 on 2019/10/14.
//  Copyright © 2019 k3ntar0. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the buttom line
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.backgroundColor = UIColor.init(red: 243/255, green: 243/255, blue: 243/255, alpha: 0.7)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    static func isPasswordValid(_ password: String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@" , "^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%?])[0-9A-Za-z!@#$%?]{8,20}$")
        return passwordTest.evaluate(with: password)
    }
}
