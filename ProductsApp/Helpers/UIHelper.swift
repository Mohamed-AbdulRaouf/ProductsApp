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
        
        if let imageUrl = imageUrl, !imageUrl.isEmpty {
            self.kf.setImage(with: URL(string: imageUrl.getImageURlAsHttps), placeholder: #imageLiteral(resourceName: "empty-box"))
            return
        } else {
            self.image = #imageLiteral(resourceName: "empty-box")
        }
    }
}

extension UIViewController {
    func alert(title: String, message: String, actions: [(String, UIAlertAction.Style)]) {
        
        let alerting = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alerting.addAction(UIAlertAction(title: action.0, style: action.1, handler: nil))
        }
        self.present(alerting, animated: true, completion: nil)
    }
    
    func segue(_ id: String) {
        self.performSegue(withIdentifier: id, sender: self)
    }
}

extension String {
    var imageURlAsHttps: String {
        var text = self
        text.insert("s", at: text.index(text.startIndex, offsetBy: 4))
        return text.components(separatedBy: ".png")[0] + ".png"
    }
}
