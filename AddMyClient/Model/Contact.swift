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
    var isValid: Bool {
        !name.isEmpty &&
        !phoneNumber.isEmpty &&
        !email.isEmpty
    }
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
