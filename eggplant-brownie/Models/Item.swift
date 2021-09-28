//
//  Item.swift
//  eggplant-brownie
//
//  Created by Nicaely Joane on 01/09/21.
//

import UIKit

class Item: NSObject, NSCoding {
    
    /* MARK: - Attributes - */
    
    let name: String
    let kcal: Double
        
    /* MARK: - Constructor(Init) - */
    
    init(name: String, kcal: Double) {
        self.name = name
        self.kcal = kcal
    }
    
    /* MARK: - NSCoding - */
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(kcal, forKey: "kcal")
    }
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        kcal = coder.decodeDouble(forKey: "kcal")
    }
}
