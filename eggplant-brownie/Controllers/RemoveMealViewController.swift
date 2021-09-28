//
//  RemoveMealViewController.swift
//  eggplant-brownie
//
//  Created by Nicaely Joane on 28/09/21.
//

import UIKit

class RemoveMealViewController {
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ meal: Dish, handler: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: .alert)
        
        let btnCancel = UIAlertAction(title: "Back to the list", style: .cancel)
        let btnRemove = UIAlertAction(title: "Remove", style: .destructive, handler: handler)
        
        alert.addAction(btnCancel)
        alert.addAction(btnRemove)
        controller.present(alert, animated: true, completion: nil)
    }
}
