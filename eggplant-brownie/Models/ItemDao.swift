//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by Nicaely Joane on 29/09/21.
//

import UIKit

class ItemDao {
    func save(_ items: [Item]) {
        do {
            let data =  try
            NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            
            guard let path = recoverDirectory() else { return }
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recovery() -> [Item] {
        do {
            guard let directory = recoverDirectory() else { return [] }
            let data = try Data(contentsOf: directory)
            let savedItems = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Item]
            
            return savedItems
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func recoverDirectory() -> URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory,
            in: .userDomainMask).first else { return nil }
        let path = directory.appendingPathComponent("items")
        return path
    }
}
