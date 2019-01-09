//
//  MainScreenController.swift
//  CatFacts
//
//  Created by Cat on 1/7/19.
//  Copyright © 2019 Oksana. All rights reserved.
//

import UIKit

class MainScreenController: BaseViewController {
    
    @IBOutlet weak var catFactsTable: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var catFacts: CatFacts?
    
// MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorStartAnimating()
        
        Request.sendRequest { data in
            guard let parsedData = data,
                let tableData = Parser.parse(receivedData: parsedData) else {
                    self.showAlert(alertMessage: AlertMessages.requestFail)
                    self.activityIndicatorStopAnimating()
                    
                    return
            }
            self.catFacts = tableData
            
            DispatchQueue.main.async {
                self.catFactsTable.reloadData()
                self.activityIndicatorStopAnimating()
            }
        }
    }
    
// MARK: Private
    
    private func activityIndicatorStartAnimating() {
        self.catFactsTable.isHidden = true
        self.activityIndicator.startAnimating()
    }
    
    private func activityIndicatorStopAnimating() {
        self.activityIndicator.stopAnimating()
        self.catFactsTable.isHidden = false
        self.activityIndicator.isHidden = true
    }
    
    @IBAction func tapLogOutButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: loggedIn)
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: UITableViewDataSource

extension MainScreenController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.catFacts?.all.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = catFactsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CatFactsCell
        guard let facts = catFacts else {
            return cell
        }
        cell.setData(data: facts.all[indexPath.row])
        
        return cell
    }
    
}
