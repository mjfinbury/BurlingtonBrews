//
//  File.swift
//  Burlington-Brews
//
//  Created by Matthew Finbury on 4/9/20.
//  Copyright © 2020 Matthew Finbury. All rights reserved.
//
import UIKit
class ItemStore {
    let itemArchiveURL: URL = {
            let documentsDirectories =
           FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let documentDirectory = documentsDirectories.first!
            return documentDirectory.appendingPathComponent("items.archive")
               
           }()
  init(){
    createItemSpecific(name:"Fiddlehead", style: "IPA", percent: 5)
    createItemSpecific(name:"Citizen Cider Lake Hopper", style: "Dry Cider", percent: 4)
    createItemSpecific(name:"Magic Hat Single Chair", style: "IPA", percent: 4)
    createItemSpecific(name:"Switchback", style: "IPA", percent: 6)
    createItemSpecific(name:"Zero Gravity", style: "IPA", percent: 5)
   }

  func saveChanges() -> Bool {
   print("Saving items to: \(itemArchiveURL.path)")
   return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
  }
    
var allItems = [Item]()
    
    @discardableResult func createItemSpecific(name: String, style: String, percent: Int) -> Item {
        let newItem = Item(name: name, style: style, percent: percent)
           allItems.append(newItem)
           return newItem
       
    }
  
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
    return newItem
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
     }
    }
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
    return
     }
     // Get reference to object being moved so you can reinsert it
     let movedItem = allItems[fromIndex]
     // Remove item from array
     allItems.remove(at: fromIndex)
     // Insert item in array at new location
     allItems.insert(movedItem, at: toIndex)
    }
 
}


  
  
    
   
    
   

