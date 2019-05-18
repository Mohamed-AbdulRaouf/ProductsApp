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

protocol NetworkManager {
    func callAPI(endPoint: EndPoint, completionHandler: @escaping (Data) -> Void,
    failHandler: @escaping (APIError) -> Void)
}

class APIError: Codable {
    let message: String
    
    init() {
        message = "something went wrong"
    }
    
    init(message: String) {
        self.message = message
    }
    
    enum CodingKeys: String, CodingKey {
        case message = "error"
    }
}

class NetworkManagerImpl: NetworkManager {
    
    func callAPI(endPoint: EndPoint, completionHandler: @escaping (Data) -> Void,
                 failHandler: @escaping (APIError) -> Void) {
        Alamofire.request(endPoint.url).validate().responseJSON { (response) in
            switch response.result {
            case .success:
                if let data = response.data {
                    self.networkSuccess(data, statusCode: response.response?.statusCode, compilationHandler: { (data) in
                        completionHandler(data )
                    }, failHandler: { (error) in
                        failHandler(error)
                    })
                } else {
                    failHandler(APIError())
                }
            case.failure(let error): failHandler(self.networkFail(error))
            }
        }
    }
    
    private func networkSuccess(_ data: Data, statusCode: Int?, compilationHandler: @escaping (Data) -> Void, failHandler: @escaping (APIError) -> Void) {
        if (200...299).contains(statusCode ?? 0) {
            compilationHandler(data)
        } else {
            failHandler(backendFail(errorData: data, statusCode: statusCode))
        }
    }
    
    private func backendFail(errorData: Data, statusCode: Int?) -> APIError {
        guard let error = try? JSONDecoder().decode(APIError.self, from: errorData) else {
            return APIError()
        }
        return error
    }

    private func networkFail(_ error: Error) -> APIError {
        /// check for reatchablity
        return APIError()
    }
}
