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

    @IBOutlet weak var productDetails: UILabel!

    func selected(_ product: Product) {
        productDetails.text = ""
        product.productDescription.enumerateLines { (line, _) in
            self.productDetails.text?.append("\(line)\n")
        }
    }

    @IBAction func backIsPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
