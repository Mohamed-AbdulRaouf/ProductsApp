//
//  NetworkManager.swift
//  ProductsApp
//
//  Created by Esraa on 5/17/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static func callAPI(endPoint: String, completionHandler: @escaping (Data) -> Void,
                        failHandler: @escaping (Error) -> Void) {
        Alamofire.request(endPoint).validate().responseJSON { (response) in
            switch response.result {
            case .success:
                if let data = response.data {
                    completionHandler(data)
                }
            case let .failure(error): failHandler(error)
            }
        }
    }
}
