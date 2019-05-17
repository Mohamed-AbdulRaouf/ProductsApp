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
    
    let presenter: ProductsPresenter!
    
    init(presenter: ProductsPresenter) {
        self.presenter = presenter
    }

    func getProducts() {
        let url = "https://limitless-forest-98976.herokuapp.com"

        NetworkManager.callAPI(endPoint: url, completionHandler: { (jsonData) in
            guard let result = try? JSONDecoder().decode(Products.self, from: jsonData) else {
                print("Fail in parthing model")
                return
            }
            self.presenter.showProducts(result)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
