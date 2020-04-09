//
//  detailViewController.swift
//  Burlington-Brews
//
//  Created by Matthew Finbury on 4/9/20.
//  Copyright © 2020 Matthew Finbury. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var styleField: UITextField!
    @IBOutlet weak var percentField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    
    var item: Item!
    
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
    nameField.text = item.name
    styleField.text = item.style
    percentField.text = numberFormatter.string(from: NSNumber(value: item.percent))
    dateLabel.text = dateFormatter.string(from: item.dateCreated)
     }
}


