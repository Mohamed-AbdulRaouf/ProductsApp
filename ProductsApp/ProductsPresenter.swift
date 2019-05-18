//
//  ProductsPresenter.swift
//  ProductsApp
//
//  Created by Esraa on 5/17/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation

class ProductsPresenter {
    
    let view: ProductsViewDelegate!
    
    init(view: ProductsViewDelegate) {
        self.view = view
    }
    
    func showProducts(_ products: [Product]) {
        view.reloadTableView(products)
    }
    
    func showAlert(_ error: String) {
        view.showAlert(error)
    }
}
