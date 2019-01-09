//
//  UserService.swift
//  CatFacts
//
//  Created by Cat on 1/7/19.
//  Copyright © 2019 Oksana. All rights reserved.
//

import UIKit

fileprivate let accountsDataKey: String = "accountsData"

class UserService {
    static var shared = UserService()
    
    private var accounts: [String: String] {
        get {
            return UserDefaults.standard.value(forKey: accountsDataKey) as? [String: String] ?? [String: String]()
        }
        set {
            UserDefaults.standard.set(newValue, forKey: accountsDataKey)
        }
    }
    
    private init() {}
    
// MARK: Public
    
    func validateAuthorization(login: String?, password: String?) -> String? {
        guard let enteredLogin = login else {
            return AlertMessages.invalidLogin
        }
        guard let enteredPassword = password else {
            return AlertMessages.invalidPassword
        }
        
        if isValidEmail(email: enteredLogin) == false {
            return AlertMessages.invalidLogin
        }
        
        guard isValidPassword(password: enteredPassword) else {
            return AlertMessages.shortPassword
        }
        
        guard let userPassword = self.accounts[enteredLogin] else {
            return AlertMessages.incorrectLoginPassword
        }
        
        if enteredPassword != userPassword {
            return AlertMessages.incorrectLoginPassword
        }
        
        return nil
    }
    
    func validateRegistration(login: String?, password: String?, confirmPassword: String?) -> String? {
        guard let enteredLogin = login else {
            return AlertMessages.invalidLogin
        }
        
        if isValidEmail(email: enteredLogin) == false {
            return AlertMessages.invalidLogin
        }
        
        if self.accounts[enteredLogin] != nil {
            return AlertMessages.userExist
        }
        
        guard let enteredPassword = password else {
            return AlertMessages.shortPassword
        }
        
        guard isValidPassword(password: enteredPassword) else {
            return AlertMessages.shortPassword
        }
        
        guard let enteredPasswordToConfirm = confirmPassword else {
            return AlertMessages.differentPasswords
        }
        
        if enteredPassword != enteredPasswordToConfirm {
            return AlertMessages.differentPasswords
        }
        
        self.accounts[enteredLogin] = enteredPassword
        
        return nil
    }
    
// MARK: Private
    
    private func isValidEmail(email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        return emailPredicate.evaluate(with: email)
    }
    
    private func isValidPassword(password: String) -> Bool {
        if password.count < 6 {
            return false
        } else {
            return true
        }
    }
    
}
