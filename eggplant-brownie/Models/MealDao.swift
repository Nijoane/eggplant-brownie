//
//  MealDao.swift
//  eggplant-brownie
//
//  Created by Nicaely Joane on 29/09/21.
//

import UIKit

class MealDao {
    func save(_ dishesList: [Dish]) {
        guard let path = recoverPath() else { return }
        do {
            let data = try NSKeyedArchiver.archivedData(
                withRootObject: dishesList,
                requiringSecureCoding: false)
            
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recovery() -> [Dish] {
        guard let path = recoverPath() else { return [] }
        do {
            let data = try Data(contentsOf: path)
            guard let savedMeal = try
                NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
                as? [Dish] else { return [] }
            
            return savedMeal
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func recoverPath() -> URL? {
        guard let directory = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask).first else { return nil }
        let path = directory.appendingPathComponent("meal")
        
        return path
    }
                
}

