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
    var networkManager: NetworkManager
    
    init(presenter: ProductsPresenter, _ networkManager: NetworkManager = NetworkManagerImpl()) {
        self.presenter = presenter
        self.networkManager = networkManager
    }

    func getProducts() {

        networkManager.callAPI(endPoint: GetProducts(), completionHandler: { (jsonData) in
            guard let result = try? JSONDecoder().decode(Products.self, from: jsonData) else {
                self.presenter.showAlert("some thing went wrong")
                return
            }
            StorageController.save(data: result)
            self.presenter.showProducts(result.productsArray)
        }) { (error) in
            self.presenter.showProducts(StorageController.getData().productsArray)
            self.presenter.showAlert(error.message)
        }
    }
}
