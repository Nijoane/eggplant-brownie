//
//  AddItemsViewController.swift
//  eggplant-brownie
//
//  Created by Nicaely Joane on 17/09/21.
//

import UIKit
 
    // MARK: - Protocols -
protocol AddItemsDelegate {
    func add(_ item: Item)
} 

class AddItemsViewController: UIViewController {
    //MARK: - Attributes -
    
    var delegate: AddItemsDelegate?
    
    init(delegate: AddItemsDelegate) {
        super.init(nibName: "AddItemsViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - IBOutlets -

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var kcalTextField: UITextField!
    
   // MARK: - View life-cycle -
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - IBAction -
    
    @IBAction func addItem(_ sender: Any) {
        guard let name =  nameTextField.text, let kcal = kcalTextField.text else {
            return
        }
        
        if let  numberOfKcal = Double(kcal) {
            let item = Item(name: name, kcal: numberOfKcal)
            
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
    }
}
