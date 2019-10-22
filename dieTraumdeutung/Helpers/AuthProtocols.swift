//
//  AuthProtocols.swift
//  dieTraumdeutung
//
//  Created by k3ntar0 on 2019/10/22.
//  Copyright © 2019 k3ntar0. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol SignUp {
    var delegate: SignUp! { get set }
    func didFailureSignUp(error: Error)
}

extension SignUp {
    func signUp(firstName: String, lastName: String, email: String, password: String) {
                    // Create the user
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            
            // Check for errors
            if err != nil {
                // There was an error creating the user
                self.delegate.didFailureSignUp(error: err!)
            } else {
                // User was created successfully, now store the first name and last name
                let db = Firestore.firestore()
                
                db.collection("users").addDocument(data: [
                    "firstname": firstName,
                    "lastname": lastName,
                    "uid": result!.user.uid
                ]) { (error) in
                    
                    if error != nil {
                        // Show error message
                        self.delegate.didFailureSignUp(error: error!)
                    }
                }
                // Transition to the home screen
//                self.transitionToHome()
            }
        }
    }
}
