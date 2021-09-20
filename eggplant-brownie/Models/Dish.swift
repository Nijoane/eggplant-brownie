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
    var items: Array<Item> = []
        
    //MARK: - Constructor (init) -
    
    init(name: String, happiness: Int, items: [Item] = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
        
    /* MARK: - Methods */
    func totalOfKcal() -> Double {
        var total: Double = 0
            
        for item in items {
            total += item.kcal
        }
        return total
    }
    
    func details() -> String {
        var message = "Happiness was \(happiness)!  Ingredients:"
        for item in items {
            message += " \(item.name),"
        }
        
        return message
    }
}
