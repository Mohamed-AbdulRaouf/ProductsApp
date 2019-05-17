//
//  Constants.swift
//  ProductsApp
//
//  Created by Esraa on 5/17/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation
import UIKit

enum Constants {
    case cellHight
    case cellIdentifier

    var floatValue: CGFloat? {
        switch self {
        case .cellHight: return 240 
        case .cellIdentifier: return nil
        }
    }
    
    var stringVaule: String? {
        switch self {
        case .cellHight: return nil
        case .cellIdentifier: return "ProductCell"
        }
    }
    
}
