//
//  CatFactsCell.swift
//  CatFacts
//
//  Created by Cat on 1/7/19.
//  Copyright © 2019 Oksana. All rights reserved.
//

import UIKit

class CatFactsCell: UITableViewCell {
    
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var catFactsTextLabel: UILabel!
    
    func setData(data: UserData) {
        let firstName = data.user?.name.first ?? ""
        let lastName = data.user?.name.last ?? ""
        self.nameLabel.text = firstName + " " + lastName
        self.catFactsTextLabel.text = data.text 
    }
    
}
