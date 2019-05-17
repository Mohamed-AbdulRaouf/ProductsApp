//
//  UIHelper.swift
//  ProductsApp
//
//  Created by Esraa on 5/17/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imageUrl: String?) {
        
        if let imageUrl = imageUrl, imageUrl != "" {
            self.kf.setImage(with: URL(string: imageUrl), placeholder: #imageLiteral(resourceName: "empty-box"))
            return
        } else {
            self.image = #imageLiteral(resourceName: "empty-box")
        }
    }
}
