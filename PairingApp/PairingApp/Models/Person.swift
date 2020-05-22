//
//  Person.swift
//  PairingApp
//
//  Created by Bethany Morris on 5/22/20.
//  Copyright © 2020 Bethany M. All rights reserved.
//

import Foundation
import CoreData

extension Person {
    
    @discardableResult
    
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
    }
    
} //End
