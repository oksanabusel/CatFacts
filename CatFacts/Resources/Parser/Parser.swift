//
//  JSONparser.swift
//  CatFacts
//
//  Created by Cat on 1/7/19.
//  Copyright © 2019 Oksana. All rights reserved.
//

import UIKit

class Parser {
    
    class func parse(receivedData: Data) -> CatFacts? {
        let jsonDecoder = JSONDecoder()
        
        do {
            let catFacts = try jsonDecoder.decode(CatFacts.self, from: receivedData)
            return catFacts
        } catch {
            print(error)
        }
        
        return nil
    }
    
}
