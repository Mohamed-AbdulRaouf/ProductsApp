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

        NetworkManager.callAPI(endPoint: GetProducts(), completionHandler: { (jsonData) in
            guard let result = try? JSONDecoder().decode(Products.self, from: jsonData) else {
                self.presenter.showAlert("some thing went wrong")
                return
            }
            self.presenter.showProducts(result)
        }) { (error) in
            self.presenter.showAlert(error.localizedDescription)
        }
    }
}
