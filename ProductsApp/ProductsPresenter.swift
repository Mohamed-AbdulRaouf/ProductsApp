//
//  ProductsPresenter.swift
//  ProductsApp
//
//  Created by Esraa on 5/17/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation

class ProductsPresenter {
    
    let view: ProductsView!
    
    init(view: ProductsView) {
        self.view = view
    }
    
    func showProducts(_ products: Products) {
        view.arrayOfProducts = products
    }
}
