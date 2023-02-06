//
//  CreateContactView.swift
//  AddMyClient
//
//  Created by Richard Garrison on 1/28/23.
//

import SwiftUI

struct CreateContactView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var vm: EditContactViewModel
    
     // MARK: - check for empty text fields & generate error message
    @State private var hasError: Bool = false
    
    var body: some View {
        
        List {
            Section("Basic Info") {
                TextField("Name", text: $vm.contact.name)
                    .keyboardType(.namePhonePad)
                TextField("Phone", text: $vm.contact.phoneNumber)
                    .keyboardType(.phonePad)
                TextField("Alternate Phone", text: $vm.contact.alternatePhone)
                    .keyboardType(.phonePad)
                TextField("Company", text: $vm.contact.companyName)
                    .keyboardType(.namePhonePad)
                TextField("Email", text: $vm.contact.email)
                    .keyboardType(.emailAddress)
            }
            Section("Billing Address") {
                TextField("Address", text: $vm.contact.address)
                    .keyboardType(.namePhonePad)
                TextField("City", text: $vm.contact.city)
                    .keyboardType(.namePhonePad)
                TextField("State", text: $vm.contact.state)
                    .keyboardType(.namePhonePad)
                TextField("Zip", text: $vm.contact.zipcode)
                    .keyboardType(.namePhonePad)
            }
            Section("Notes") {
                TextField("",
                          text: $vm.contact.notes,
                          axis: .vertical)
                    
            }
        }
        .navigationTitle(vm.isNew ? "New Client" : "Update Contact")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    do {
                        try vm.save()
                        dismiss()
                    } catch {
                        print(error)
                    }
                     // MARK: - validate text fields extension
                    //validate()
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
         // MARK: - add alert
        .alert("Sumpin ain't right y'all!", isPresented: $hasError, actions: {}) {
            Text("Your form is invalid")
        }
    }
}

 // MARK: - function to validate text fields
//private extension CreateContactView {
//    func validate() {
//        if vm.contact.isValid {
//            do {
//                try vm.save()
//                dismiss()
//            } catch {
//                print(error)
//            }
//        } else {
//            hasError = true
//        }
//    }
//}

struct CreateClientView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            let preview = ContactsProvider.shared
            CreateContactView(vm: .init(provider: preview))
                .environment(\.managedObjectContext, preview.viewContext)
            
        }
    }
}
