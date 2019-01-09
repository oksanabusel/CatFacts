//
//  AuthorizationScreenController.swift
//  CatFacts
//
//  Created by Cat on 1/7/19.
//  Copyright © 2019 Oksana. All rights reserved.
//

import UIKit

class AuthorizationScreenController: BaseViewController {
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let userService = UserService.shared
    
// MARK: Lifecycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.emailAddressTextField.text = ""
        self.passwordTextField.text = ""
        
        self.setupHideKeyboardOnTap()

        if UserDefaults.standard.bool(forKey: loggedIn) {
            performSegue(withIdentifier: toMainScreenSegue, sender: self)
        }
    }
    
// MARK: Private

    private func isAuthorizationComplete() -> Bool {
        if let alertMessage = userService.validateAuthorization(login: emailAddressTextField.text,
                                                             password: passwordTextField.text) {
            self.showAlert(alertMessage: alertMessage)
            
            return false
        }
        return true
    }
    
    @IBAction func tapLogInButton(_ sender: Any) {
        if isAuthorizationComplete() {
            emailAddressTextField.text = ""
            passwordTextField.text = ""
            performSegue(withIdentifier: toMainScreenSegue, sender: self)
            UserDefaults.standard.set(true, forKey: loggedIn)
        }
    }

}

// MARK: extension

extension AuthorizationScreenController {
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }
    
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        
        return tap
    }
    
}
