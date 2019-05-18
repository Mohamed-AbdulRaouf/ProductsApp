//
//  ProductDetails.swift
//  ProductsApp
//
//  Created by Esraa on 5/18/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

protocol ProductDetailsDelegate {
    func selected(_ product: Product)
}

class ProductDetailsView: UIViewController, ProductDetailsDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func selected(_ product: Product) {
        print(product.name)
    }
}
