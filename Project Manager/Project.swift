//
//  IProjectObject.swift
//  Project Manager
//
//  Created by Student on 11/3/16.
//  Copyright © 2016 Hunter Pollpeter. All rights reserved.
//

import UIKit

class Project: SectionObject {
//    var phases: [Phase]!
//    var properties: [String: AnyObject]!
    
    init(name: String, details: String = "", start: NSDate, deadline: NSDate) {
        super.init()
        self.properties = ["Name": name,
                           "Details": details,
                           "Start": start,
                           "Deadline": deadline,
                           "Complete": false]
        self.childSections = []
    }

    
    convenience init(random: Bool = false) {
        if random {
            let names = ["Cool Project", "Fun Project", "Hard Project", "Easy Project"]
            
            let idx = arc4random_uniform(UInt32(names.count))
            let randomName = names[Int(idx)]
            
            self.init(name: randomName, start: NSDate(), deadline: NSDate())
            
            let randomValue = arc4random_uniform(10)
            for _ in 0...randomValue {
                self.childSections.append(Phase(random: true))
            }
            self.properties["Details"] = "These are some details about this project"
        }
        else {
            self.init(name: "No Name", start: NSDate(), deadline: NSDate())
        }
    }
}
