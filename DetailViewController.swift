//
//  detailViewController.swift
//  Burlington-Brews
//
//  Created by Matthew Finbury on 4/9/20.
//  Copyright © 2020 Matthew Finbury. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var styleField: UITextField!
    @IBOutlet var percentField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    var item: Item! {
    didSet {
        navigationItem.title = item.name
     }
    }
    
    let numberFormatter: NumberFormatter = {
     let formatter = NumberFormatter()
     formatter.numberStyle = .decimal
     formatter.minimumFractionDigits = 2
     formatter.maximumFractionDigits = 2
     return formatter
    }()
    let dateFormatter: DateFormatter = {
     let formatter = DateFormatter()
     formatter.dateStyle = .medium
     formatter.timeStyle = .none
     return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
        // Clear first responder
        view.endEditing(true)
    nameField.text = item.name
    styleField.text = item.style
    percentField.text = numberFormatter.string(from: NSNumber(value: item.percent))
    dateLabel.text = dateFormatter.string(from: item.dateCreated)
     }
    override func viewWillDisappear(_ animated: Bool) {
     super.viewWillDisappear(animated)
     // "Save" changes to item
     item.name = nameField.text ?? ""
     item.style = styleField.text
    if let valueText = percentField.text,
    let value = numberFormatter.number(from: valueText) {
    item.percent = value.intValue
     } else {
    item.percent = 0
     }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     textField.resignFirstResponder()
     return true
    }
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}




