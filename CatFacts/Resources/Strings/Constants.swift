//
//  Constants.swift
//  CatFacts
//
//  Created by Cat on 1/7/19.
//  Copyright © 2019 Oksana. All rights reserved.
//

import Foundation

struct AlertMessages {
    static let invalidPassword: String        = "Invalid password."
    static let invalidLogin: String           = "Invalid login. Please, enter a valid email."
    static let differentPasswords: String     = "Your passwords aren't identical."
    static let shortPassword: String          = "Your password is too short."
    static let incorrectLoginPassword: String = "Incorrect login or password."
    static let userExist: String              = "The user already exist."
    static let requestFail: String            = "Request failure."
    static let errorTitle: String             = "Error"
    static let okTitle: String                = "Ok"
}


let toMainScreenSegue: String = "toMainScreenSegue"
let url: String = "https://cat-fact.herokuapp.com/facts"
let loggedIn: String = "isUserLoggedIn"
