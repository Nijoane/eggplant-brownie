//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Nicaely Joane on 26/08/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var happinesTextField: UITextField!

    @IBAction func add(_ sender: Any) {
        let name = nameTextField.text
        let happiness = happinesTextField.text
        
        print("comi \(String(describing: name)) e  fiquei com felicidade: \(String(describing: happiness))")
    }
}
