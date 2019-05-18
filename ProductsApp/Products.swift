//
//  Products.swift
//  ProductsApp
//
//  Created by Esraa on 5/17/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation

class Products: Codable {
    let productsArray: [Product]
    let count: Int
    
    init(Products: [Product], count: Int) {
        self.productsArray = Products
        self.count = count
    }
    
    enum CodingKeys: String, CodingKey {
        case productsArray = "data"
        case count
    }
}

class Product: Codable {
    let id: Int
    let name, productDescription: String
    let image: Image
    let price: Int
    
    init(id: Int, name: String, productDescription: String, image: Image, price: Int) {
        self.id = id
        self.name = name
        self.productDescription = productDescription
        self.image = image
        self.price = price
    }
}

class Image: Codable {
    let link: String
    let height, width: String
    
    init(link: String, height: String, width: String) {
        self.link = link
        self.height = height
        self.width = width
    }
}
