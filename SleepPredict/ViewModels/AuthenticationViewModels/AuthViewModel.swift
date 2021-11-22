//
//  AuthViewModel.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 20.11.2021..
//

import Foundation
import FirebaseAuth
import SwiftUI

class AuthViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil 
    }
 
    func logIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else {return}
            
            guard result != nil, error == nil else {return}
            //success
            DispatchQueue.main.async {
                    self.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else {return}
            
            guard result != nil, error == nil else {return}
            //success
            DispatchQueue.main.async {
                    self.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        withAnimation(.default) {
            self.signedIn = false
        }
    }
}
