//
//  TableViewController.swift
//  eggplant-brownie
//
//  Created by Nicaely Joane on 08/09/21.
//

import UIKit

class TableViewController: UITableViewController, AddMealDelegate{
    var dishesList = [
        Dish(name: "Ice Cream", happiness: 4),
        Dish(name: "Pizza", happiness: 4),
        Dish(name: "Pasta", happiness: 5),
        Dish(name: "Rice", happiness: 3)
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dishes = dishesList[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = dishes.name
        
        return cell
    }  
    
    func add(_ dish: Dish) {
        dishesList.append(dish)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
}
