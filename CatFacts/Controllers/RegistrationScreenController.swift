//
//  RegistrationScreenController.swift
//  CatFacts
//
//  Created by Cat on 1/7/19.
//  Copyright © 2019 Oksana. All rights reserved.
//

import UIKit

class RegistrationScreenController: BaseViewController {
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    let userService = UserService.shared
    
// MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupHideKeyboardOnTap()
    }
    
// MARK: Private

    private func isRegistrationComplete() -> Bool {
        if let alertMessage = userService.validateRegistration(login: emailAddressTextField.text,
                                                            password: passwordTextfield.text,
                                                     confirmPassword: confirmPasswordTextField.text) {
            self.showAlert(alertMessage: alertMessage)
            
            return false
        }
        return true
    }

    @IBAction func tapRegisterButton(_ sender: Any) {
        if isRegistrationComplete() {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: extension

extension RegistrationScreenController {
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
