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
    
    private let context: NSManagedObjectContext
    
    init(provider: ContactsProvider, contact: Contact? = nil) {
        self.context = provider.newContext
        self.contact = Contact(context: self.context)
    }
    
    func save() throws {
        if context.hasChanges {
            try context.save()
        }
    }
    
}
