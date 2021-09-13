//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Nicaely Joane on 26/08/21.
//

import UIKit

// MARK: - Protocols -

protocol AddMealDelegate {
    func add(_ dish: Dish)
}

class ViewController: UIViewController, UITableViewDataSource {
    // MARK: - Attributes -
    
    var delegate: AddMealDelegate?
    var items: [String] = ["Tomato Sauce", "Cheese", "Basil", "Ground Meat"]
    
    // MARK: - IBOutelets -
    
    @IBOutlet var nameTextField: UITextField?
    @IBOutlet var happinesTextField: UITextField?
    
    // MARK: - UITableViewDataSource -
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let lineOfTable  = indexPath.row
        let item = items[lineOfTable]
        
        cell.textLabel?.text = item
         
        return cell
    }
    
    // MARK: - IBActions -
    
    @IBAction func add(_ sender: Any) {
        
        guard let nameOfDish = nameTextField?.text else {
            return
        }
           
        guard let happinessOfDish = happinesTextField?.text, let
            happiness = Int(happinessOfDish) else {
            return
        }
        
        let dish = Dish(name: nameOfDish, happiness: happiness)
        
        print("I ate \(dish.name) and my happiness was: \(dish.happiness)")
                
        delegate?.add(dish)
        navigationController?.popViewController(animated: true)
    }
}

