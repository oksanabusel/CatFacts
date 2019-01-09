//
//  Request.swift
//  CatFacts
//
//  Created by Cat on 1/7/19.
//  Copyright © 2019 Oksana. All rights reserved.
//

import Foundation
import Alamofire

class Request {
    class func sendRequest(completion: @escaping (Data?) -> Void) {
        Alamofire.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                if (response.result.error == nil) {
                    completion(response.data!)
                } else {
                    completion(nil)
                }
        }
    }
    
}
