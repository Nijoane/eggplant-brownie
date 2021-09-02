//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Nicaely Joane on 26/08/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField?
    
    @IBOutlet var happinesTextField: UITextField?

    @IBAction func add(_ sender: Any) {
        if let nameOfDish = nameTextField?.text,
           let happinessOfDish = happinesTextField?.text {
        
            let name = nameOfDish
            if let happiness = Int(happinessOfDish) {
                
                let dish = Dish(name: name, happiness: happiness)
                    
                print("Eu comi \(dish.name) e fiquei com felicidade: \(dish.happiness)")
            } else {
                print("Error when trying to create a meal :(")
            }
        }
    }
}
