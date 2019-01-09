//
//  CatFacts.swift
//  CatFacts
//
//  Created by Cat on 1/7/19.
//  Copyright © 2019 Oksana. All rights reserved.
//

import Foundation

class CatFacts: Codable {
    var all: [UserData]
}

class UserData: Codable {
    var text: String
    var user: User?
    
    enum CodingKeys: String, CodingKey {
        case text
        case user = "user"
    }
    
    init(text: String, user: User?) {
        self.text = text
        self.user = user
    }
    
    convenience required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let text = try values.decodeIfPresent(String.self, forKey: .text) ?? ""
        let user = try values.decodeIfPresent(User.self, forKey: .user)
        
        self.init(text: text, user: user)
    }
}

class User: Codable {
    var name: Name
}

class Name: Codable {
    var first: String
    var last: String
}
