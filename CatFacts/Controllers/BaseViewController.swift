//
//  ViewController.swift
//  CatFacts
//
//  Created by Cat on 1/8/19.
//  Copyright © 2019 Oksana. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert(alertMessage: String) {
        let alert = UIAlertController(title: AlertMessages.errorTitle, message: alertMessage,
                             preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: AlertMessages.okTitle,
                                      style: UIAlertAction.Style.default,
                                    handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
