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
    @IBAction func backIsPressed(_ sender: UIButton) {
        
    }
    
    func selected(_ product: Product) {
        let sentence = product.productDescription
        var lines: [String] = []
        sentence.enumerateLines { (line, _) in
            lines.append(line)
        }
        
        productDetails.text = product.productDescription
        print(product.productDescription)
    }
}
