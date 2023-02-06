//
//  ContactsProvider.swift
//  AddMyClient
//
//  Created by Richard Garrison on 1/28/23.
//  This file helps to manage and interact with data in the CoreData, data model

import Foundation
import CoreData
import SwiftUI

final class ContactsProvider {
    
     // MARK: - 1. Create a singleton to share data accross app
    static let shared = ContactsProvider()
    
     // MARK: - 2. create constant to load container
    private let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    var newContext: NSManagedObjectContext {
        persistentContainer.newBackgroundContext()
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "ClientsDataModel")
        
        if EnvironmentValues.isPreview {
            persistentContainer.persistentStoreDescriptions.first?.url = .init(fileURLWithPath: "/dev/null")
        }
        
         // MARK: - 3. file watches for changes and merges all changes
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                fatalError("Unable to load store with error: \(error)")
            }
        }
    }
    
    func exists(_ contact: Contact, in context: NSManagedObjectContext) -> Contact? {
        try? context.existingObject(with: contact.objectID) as? Contact
    }
    
    func delete(_ contact: Contact, in context: NSManagedObjectContext) throws {
        if let existingContact = exists(contact, in: context) {
            context.delete(existingContact)
            Task(priority: .background) {
                try await context.perform {
                    try context.save()
                }
            }
        }
    }
    
    func persists(in context: NSManagedObjectContext) throws {
        if context.hasChanges {
            try context.save()
        }
    }
    
}
 // MARK: - Setup for seperate previews
extension EnvironmentValues {
    static var isPreview: Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}
