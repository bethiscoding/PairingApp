//
//  PersonController.swift
//  PairingApp
//
//  Created by Bethany Morris on 5/22/20.
//  Copyright © 2020 Bethany M. All rights reserved.
//

import Foundation
import CoreData

class PersonController {
    
    // MARK: - Singleton
    
    static let sharedInstance = PersonController()
    
    // MARK: - Source of Truth
    
    var people: [Person] {
        let MOC = CoreDataStack.context
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        let fetchResults = try? MOC.fetch(fetchRequest)
        return fetchResults ?? []
    }
    
    // MARK: - CRUD Methods
    
    func createPerson(name: String) {
        _ = Person(name: name)
        saveToPersistentStorage()
        print("Saved person successfully")
    }
    
    func deletePerson(personToDelete: Person) {
        if let MOC = personToDelete.managedObjectContext {
            MOC.delete(personToDelete)
            saveToPersistentStorage()
            print("Deleted person successfully")
        }
    }
    
    func saveToPersistentStorage() {
        let MOC = CoreDataStack.context
        do {
            try MOC.save()
        } catch {
            print("There was an issue saving: \(error) \(error.localizedDescription)")
        }
    }
    
} //End
