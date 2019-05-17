//
//  ProductsInteractor.swift
//  ProductsApp
//
//  Created by Esraa on 5/17/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation
import Alamofire

class ProductsInteractor {
    
    static func getProducts() {
        
        let url = "https://limitless-forest-98976.herokuapp.com"
        callAPI(endPoint: url, completionHandler: { (jsonData) in
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
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
