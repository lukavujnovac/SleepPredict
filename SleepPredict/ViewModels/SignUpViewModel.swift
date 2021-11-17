//
//  SignUpViewModel.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 17.11.2021..
//

import Foundation
import Combine
import SwiftUI

class SignUpViewModel: ObservableObject{
    @Published var username: String = ""
    @Published var usernameIsValid: Bool = false
    
    @Published var password1: String = ""
    @Published var password1IsValid: Bool = false
    
    @Published var password2: String = ""
    @Published var password2IsValid: Bool = false
    
    @Published var showButton: Bool = false
    
    @Published var passwordsMatching: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        validateUsername()
        validatePassword()
    }
    
    func validateUsername() {
        $username
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map { usernameText -> Bool in
                if usernameText.contains("@") {
                    return true
                }
                    return false
            }
            .sink { [weak self] isValid in
                self?.usernameIsValid = isValid
            }
            .store(in: &cancellables)
    }
    
    func validatePassword() {
        $password1
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map { passwordText -> Bool in
                if passwordText.count > 7 {
                    return true
                }
                return false
            }
            .sink { [weak self] isValid in
                self?.password1IsValid = isValid
            }
            .store(in: &cancellables)
        
        $password2
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map { passwordText -> Bool in
                if passwordText.count > 7 {
                    return true
                }
                return false
            }
            .sink { [weak self] isValid in
                self?.password2IsValid = isValid
            }
            .store(in: &cancellables)
    }
    
    func checkPasswordsMatching() -> Bool {
        if password1 == password2 {
                passwordsMatching = true  
        }else {
                passwordsMatching = false
        }
        return passwordsMatching
    }
}
