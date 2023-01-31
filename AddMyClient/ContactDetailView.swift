//
//  ContactDetailView.swift
//  AddMyClient
//
//  Created by Richard Garrison on 1/28/23.
//

import SwiftUI

struct ContactDetailView: View {
    
    //let contact: Contact
    
    var body: some View {
        List {
            
            Section("General") {
                
                LabeledContent {
                    Text("Email Here")
                } label: {
                    Text("Email")
                }
                
                LabeledContent {
                    Text("Phone number here")
                } label: {
                    Text("Phone Number")
                }
                
            }
            
            Section("Billing Address") {
                LabeledContent {
                    Text("Billing Address")
                } label: {
                    Text("Address")
                }
                
                LabeledContent {
                    Text("City")
                } label: {
                    Text("City")
                }
                
                LabeledContent {
                    Text("State")
                } label: {
                    Text("State")
                }
                
                LabeledContent {
                    Text("Zipcode")
                } label: {
                    Text("Zipcode")
                }
            }
            
            Section("Notes") {
                Text("Lorem ipsum blah blah blah")
            }
        }
        .navigationTitle("Client Details")
    }

}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContactDetailView()
        }
    }
}
