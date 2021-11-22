//
//  File.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 17.11.2021..
//

import Foundation
import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var usernameIsValid: Bool = false
    
    @Published var password: String = ""
    @Published var passwordIsValid: Bool = false
    
    @Published var showButton: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        validateUsername()
        validatePassword()
        addButtonSubscribers()
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
        $password
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map { passwordText -> Bool in
                if passwordText.count > 7 {
                    return true
                }
                return false
            }
            .sink { [weak self] isValid in
                self?.passwordIsValid = isValid
            }
            .store(in: &cancellables)
    }
    
    func addButtonSubscribers() {
        $passwordIsValid
            .combineLatest($usernameIsValid)
            .sink { [weak self] (usernameIsValid, passwordIsValid) in
                guard let self = self else {return}
                
                if passwordIsValid && usernameIsValid {
                    
                    withAnimation(.default) {
                        self.showButton = true
                    }
                }else {
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
    
}
