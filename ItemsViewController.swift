//
//  File.swift
//  Burlington-Brews
//
//  Created by Matthew Finbury on 4/9/20.
//  Copyright © 2020 Matthew Finbury. All rights reserved.
//
import UIKit

class ItemsViewController: UITableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "showItem"?:
       // Figure out which row was just tapped
       if let row = tableView.indexPathForSelectedRow?.row {
       // Get the item associated with this row and pass it along
       let item = itemStore.allItems[row]
       let DetailViewController
       = segue.destination as! DetailViewController
       DetailViewController.item = item
       }
        default:
       preconditionFailure("Unexpected segue identifier.")
        }
       }
    
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(_ sender: UIButton) {
       // Create a new item and add it to the store
        let newItem = itemStore.createItem()
         // Figure out where that item is in the array
        if let index = itemStore.allItems.firstIndex(of:newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
         }
    }
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        // If you are currently in editing mode...
         if isEditing {
        // Change text of button to inform user of state
        sender.setTitle("Edit", for: .normal)
        // Turn off editing mode
        setEditing(false, animated: true)
         } else {
        // Change text of button to inform user of state
        sender.setTitle("Done", for: .normal)
        // Enter editing mode
        setEditing(true, animated: true)
         }
    }

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   return itemStore.allItems.count
      }
    override func tableView(_ tableView: UITableView,
    cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     // Create an instance of UITableViewCell, with default appearance
     let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
     // Set the text on the cell with the description of the item
     // that is at the nth index of items, where n = row this cell
     // will appear in on the tableview
     let item = itemStore.allItems[indexPath.row]
     cell.textLabel?.text = item.name
     cell.detailTextLabel?.text = "$\(item.percent)"
     return cell
    }
    
    override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,
      forRowAt indexPath: IndexPath) {
       // If the table view is asking to commit a delete command...
       if editingStyle == .delete {
      let item = itemStore.allItems[indexPath.row]
        let title = "Delete \(item.name)?"
        let message = "Are you sure you want to delete this item?"
        let ac = UIAlertController(title: title,
        message: message,
        preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
        handler: { (action) -> Void in
      // Remove the item from the store
            self.itemStore.removeItem(item)
      // Also remove that row from the table view with an animation
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
       })
        ac.addAction(deleteAction)
        present(ac, animated: true, completion: nil)
    }
    }
          override func tableView(_ tableView: UITableView,
            moveRowAt sourceIndexPath: IndexPath,
            to destinationIndexPath: IndexPath) {
             // Update the model
             itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
            }
   
}
