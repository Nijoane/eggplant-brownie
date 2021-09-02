//
//  Item.swift
//  eggplant-brownie
//
//  Created by Nicaely Joane on 01/09/21.
//

import UIKit

class Item: NSObject {
    
    /* MARK: - Attributes */
    let name: String
    let kcal: Double
        
    /* MARK: - Constructor(Init) */
    init(name: String, kcal: Double) {
        self.name = name
        self.kcal = kcal
    }
}