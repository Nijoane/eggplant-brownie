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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemsDelegate {
    // MARK: - Attributes -
    
    var delegate: AddMealDelegate?
    var items: [Item] = [
        Item(name: "Tomato Sauce", kcal: 40.00),
        Item(name: "Cheese", kcal: 40.00),
        Item(name: "Basil", kcal: 40.00),
        Item(name: "Ground Meat", kcal: 40.00)
    ]
    
    var selectedItems: [Item] = []
    
    // MARK: - IBOutelets -
    
    @IBOutlet var nameTextField: UITextField?
    @IBOutlet var happinesTextField: UITextField?
    @IBOutlet weak var itemsTableView: UITableView?
    
    // MARK: - View life-cycle -
    
    override func viewDidLoad() {
        let btnAddItem = UIBarButtonItem(title: "Add new item", style: .plain, target: self, action: #selector(addItem))
        navigationItem.rightBarButtonItem = btnAddItem
    }
    
    @objc func addItem(){
        let addItemsViewController = AddItemsViewController(delegate: self)
        
        navigationController?.pushViewController(addItemsViewController, animated: true)
    }
    // MARK: - UITableViewDataSource -
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let lineOfTable  = indexPath.row
        let item = items[lineOfTable]
        
        cell.textLabel?.text = item.name
         
        return cell
    }
    
    func add(_ item: Item) {
        items.append(item)
        itemsTableView?.reloadData()
        if let tablewView = itemsTableView {
            tablewView.reloadData()
            
        } else {
            Alert(controller: self).show(message: "the table cannot be updated")
        }
    }
    
    // MARK: - UITableViewDelegate -
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            
            let lineOfTable = indexPath.row
            selectedItems.append(items[lineOfTable])
            
        } else {
            cell.accessoryType = .none
            
            let item = items[indexPath.row]
            if let position = selectedItems.firstIndex(of: item) {
                selectedItems.remove(at: position)
                
                for selectedItem in selectedItems {
                    print(selectedItem.name)
                }
            }
        }
    }
    
    func dishRecovery() -> Dish? {
        guard let nameOfDish = nameTextField?.text else { return nil }
           
        guard let happinessOfDish = happinesTextField?.text,
                let happiness = Int(happinessOfDish) else { return nil }
        
        let dish = Dish(name: nameOfDish, happiness: happiness , items: selectedItems)
        
        return dish
    }
    
    
    // MARK: - IBActions -
    
    @IBAction func add(_ sender: Any) {
        if let dish = dishRecovery() {
            delegate?.add(dish)
            navigationController?.popViewController(animated: true)
        
        } else {
            Alert(controller: self).show(message: "Error reading form data")
        }
    }
}

