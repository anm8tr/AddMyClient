//
//  ContentView.swift
//  AddMyClient
//
//  Created by Richard Garrison on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingNewContact = false
    
    var provider = ContactsProvider.shared
    
    var body: some View {
        NavigationStack {
            List {
                ForEach((0...10), id: \.self) { item in
                    
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: ContactDetailView()) {
                            EmptyView()
                        }
                        .opacity(0)
                        ContactRowView()
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
