//
//  ContactDetailView.swift
//  AddMyClient
//
//  Created by Richard Garrison on 1/28/23.
//

import SwiftUI

struct ContactDetailView: View {
    
    let contact: Contact
    
    var body: some View {
        List {
            
            Section("General") {
                
                LabeledContent {
                    Text(contact.companyName)
                } label: {
                    Text("Company")
                }
                LabeledContent {
                    Text(contact.email)
                } label: {
                    Text("Email")
                }
                
                LabeledContent {
                    Text(contact.phoneNumber)
                } label: {
                    Text("Phone Number")
                }
                LabeledContent {
                    Text(contact.alternatePhone)
                } label: {
                    Text("Alt Phone Number")
                }
                
            }
            
            Section("Billing Address") {
                LabeledContent {
                    Text(contact.address)
                } label: {
                    Text("Address")
                }
                
                LabeledContent {
                    Text(contact.city)
                } label: {
                    Text("City")
                }
                
                LabeledContent {
                    Text(contact.state)
                } label: {
                    Text("State")
                }
                
                LabeledContent {
                    Text(contact.zipcode)
                } label: {
                    Text("Zipcode")
                }
            }
            
            Section("Notes") {
                Text(contact.notes)
            }
        }
        .navigationTitle("Client Details")
    }

}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContactDetailView(contact: .preview())
        }
    }
}
