//
//  EditContactViewModel.swift
//  AddMyClient
//
//  Created by Richard Garrison on 1/30/23.
//

import Foundation
import CoreData


final class EditContactViewModel: ObservableObject {
    
    @Published var contact: Client
    
    private let context: NSManagedObjectContext
    
    init(provider: ContactsProvider, contact: Client? = nil) {
        self.context = provider.newContext
        self.contact = Client(context: self.context)
    }
    
    func save() throws {
        if context.hasChanges {
            try context.save()
        }
    }
    
}
