//
//  Item.swift
//  Burlington-Brews
//
//  Created by Matthew Finbury on 4/9/20.
//  Copyright © 2020 Matthew Finbury. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var style: String?
    var percent: Int
    let dateCreated: Date
    
    init(name: String, style: String?, percent: Int){
        self.name = name
        self.style = style
        self.percent = percent
        self.dateCreated = Date()
        
        super.init()
    }
    
    
  convenience init(random: Bool = false) {
   if random {
  let adjectives = ["Fluffy", "Rusty", "Shiny"]
  let nouns = ["Bear", "Spork", "Mac"]
  var idx = arc4random_uniform(UInt32(adjectives.count))
  let randomAdjective = adjectives[Int(idx)]
  idx = arc4random_uniform(UInt32(nouns.count))
  let randomNoun = nouns[Int(idx)]
  let randomName = "\(randomAdjective) \(randomNoun)"
  let randomValue = Int(arc4random_uniform(100))
  let randomSerialNumber =
  UUID().uuidString.components(separatedBy: "-").first!
  self.init(name: randomName,
  style: randomSerialNumber,
  percent: randomValue)
   } else {
  self.init(name: "", style: nil, percent: 0)
   }
  }
}

