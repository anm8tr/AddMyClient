//
//  Client.swift
//  AddMyClient
//
//  Created by Richard Garrison on 1/26/23.
//

import Foundation
import CoreData

 // MARK: - create model for data
final class Contact: NSManagedObject, Identifiable {
    
    @NSManaged var name: String
    @NSManaged var address: String
    @NSManaged var city: String
    @NSManaged var state: String
    @NSManaged var zipcode: String
    @NSManaged var phoneNumber: String
    @NSManaged var alternatePhone: String
    @NSManaged var email: String
    @NSManaged var companyName: String
    @NSManaged var notes: String
    

     // MARK: - check for empty text fields
    var isValid: Bool { !name.isEmpty && !phoneNumber.isEmpty && !email.isEmpty }
    
}

extension Contact {
    private static var contactsFetchRequest: NSFetchRequest<Contact> {
        NSFetchRequest(entityName: "Contact")
    }
    
    static func all() -> NSFetchRequest<Contact> {
        let request: NSFetchRequest<Contact> = contactsFetchRequest
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Contact.name, ascending: true)
        ]
        return request
    }
    
}

extension Contact {
    @discardableResult
    static func makePreview(count: Int, in context: NSManagedObjectContext) -> [Contact] {
        var contacts = [Contact]()
        for i in 0..<count {
            let contact = Contact(context: context)
            contact.name = "item \(i)"
            contact.companyName = "item \(i)"
            contact.phoneNumber = "480-350-0024 \(i)"
            contact.alternatePhone = "602-350-0024 \(i)"
            contact.email = "test_ \(i)@mail.com"
            contact.address = "item \(i)"
            contact.city = "item \(i)"
            contact.state = "item \(i)"
            contact.zipcode = "item \(i)"
            contact.notes = "This is a preview for item \(i)"
            contacts.append(contact)
        }
        return contacts
    }
    
    static func preview(context: NSManagedObjectContext = ContactsProvider.shared.viewContext) -> Contact {
        return makePreview(count: 1, in: context)[0]
    }
    
    static func empty(context: NSManagedObjectContext = ContactsProvider.shared.viewContext) -> Contact {
        return Contact(context: context)
    }
}

