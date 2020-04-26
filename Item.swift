//
//  Item.swift
//  Burlington-Brews
//
//  Created by Matthew Finbury on 4/9/20.
//  Copyright © 2020 Matthew Finbury. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding  {
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
    func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "name")
    aCoder.encode(dateCreated, forKey: "dateCreated")
    aCoder.encode(style, forKey: "style")
    aCoder.encode(percent, forKey: "percent")
    }
    required init(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObject(forKey: "name") as! String
    dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
    style = aDecoder.decodeObject(forKey: "style") as! String?
    percent = aDecoder.decodeInteger(forKey: "percent")
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
  let randomvalue = Int(arc4random_uniform(100))
  let randomSerialNumber =
  UUID().uuidString.components(separatedBy: "-").first!
  self.init(
    name: randomName,
    style: randomSerialNumber,
    percent: randomvalue)
   } else {
    self.init(name: "", style: nil, percent: 0)
   }
  }
}

