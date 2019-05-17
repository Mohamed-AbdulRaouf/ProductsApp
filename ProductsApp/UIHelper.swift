//
//  UIHelper.swift
//  ProductsApp
//
//  Created by Esraa on 5/17/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
    }
}
