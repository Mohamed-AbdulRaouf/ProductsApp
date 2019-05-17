//
//  NetworkManager.swift
//  ProductsApp
//
//  Created by Esraa on 5/17/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation
import Alamofire

protocol EndPoint {
    var url: String {get set}
}

struct GetProducts: EndPoint {
    var url: String = "https://limitless-forest-98976.herokuapp.com"
}

class NetworkManager {
    
    static func callAPI(endPoint: EndPoint, completionHandler: @escaping (Data) -> Void,
                        failHandler: @escaping (Error) -> Void) {
        Alamofire.request(endPoint.url).validate().responseJSON { (response) in
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
