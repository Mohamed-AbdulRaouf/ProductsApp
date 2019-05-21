//
//  UserDefultsHelper.swift
//  ProductsApp
//
//  Created by Esraa on 5/21/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation

typealias CashedData = Products

class StorageController {
    static var cashedData = CashedData()
    
    static func save(data: CashedData) {
        if let encodedData = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encodedData, forKey: "CashedData")
        }
    }
    
    static func getData() -> CashedData {
        if let decodedData = try? JSONDecoder().decode(CashedData.self, from: UserDefaults.standard.value(forKey: "CashedData") as? Data ?? Data()) {
            return decodedData
        }
        return cashedData
    }
}

