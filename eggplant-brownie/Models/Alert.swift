//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Nicaely Joane on 24/09/21.
//

import UIKit

class Alert {
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    
    func show(title: String = "Sorry", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let btnBack = UIAlertAction(title: "Go back", style: .cancel, handler: nil)
        
        alert.addAction(btnBack)
        controller.present(alert, animated: true, completion: nil)
    }
}
