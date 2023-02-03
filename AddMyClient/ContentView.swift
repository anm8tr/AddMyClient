//
//  ContentView.swift
//  AddMyClient
//
//  Created by Richard Garrison on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingNewContact = false
    
    @FetchRequest(fetchRequest: Contact.all()) private var contacts
    
    var provider = ContactsProvider.shared
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts) { contact in
                    
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: ContactDetailView(contact: contact)) {
                            EmptyView()
                        }
                        .opacity(0)
                        ContactRowView(contact: contact)
                    }
                   
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isShowingNewContact.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $isShowingNewContact, content: {
                NavigationStack {
                    CreateContactView(vm: .init(provider: provider))
                }
            })
            .navigationTitle("Clients")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
