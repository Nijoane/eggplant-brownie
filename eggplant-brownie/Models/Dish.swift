//
//  Dish.swift
//  eggplant-brownie
//
//  Created by Nicaely Joane on 01/09/21.
//

import UIKit

class Dish: NSObject {
    
    /* MARK: - Attributes */
    let name: String
    let happiness: Int
    let itens: Array<Item> = []
        
    /* MARK: - Constructor (init) */
    init(name: String, happiness: Int) {
        self.name = name
        self.happiness = happiness
    }
        
    /* MARK: - Methods */
    func totalOfKcal() -> Double {
        var total: Double = 0
            
        for item in itens {
            total += item.kcal
        }
        return total
    }
}
