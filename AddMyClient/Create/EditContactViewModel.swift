//
//  EditContactViewModel.swift
//  AddMyClient
//
//  Created by Richard Garrison on 1/30/23.
//

import Foundation
import CoreData


final class EditContactViewModel: ObservableObject {
    
    @Published var contact: Contact
    
    let isNew: Bool;
    
    private let context: NSManagedObjectContext
    
    init(provider: ContactsProvider, contact: Contact? = nil) {
        self.context = provider.newContext
        if let contact,
           let existingContactCopy = try? context.existingObject(with: contact.objectID) as? Contact {
            
            self.contact = existingContactCopy
            self.isNew = false
            
        } else {
            self.contact = Contact(context: self.context)
            self.isNew = true
        }
        
    }
    
    func save() throws {
        if context.hasChanges {
            try context.save()
        }
    }
    
}
