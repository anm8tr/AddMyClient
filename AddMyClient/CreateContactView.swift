//
//  CreateContactView.swift
//  AddMyClient
//
//  Created by Richard Garrison on 1/28/23.
//

import SwiftUI

struct CreateContactView: View {
    
    @Environment(\.dismiss) private var dismiss
    //@ObservedObject var vm: EditClientViewModel
    
     // MARK: - check for empty text fileds & generate error message
    @State private var hasError: Bool = false
    
    var body: some View {
        
        List {
            Section("Basic Info") {
                TextField("Name", text: .constant(""))
                    .keyboardType(.namePhonePad)
                TextField("Phone", text: .constant(""))
                    .keyboardType(.phonePad)
                TextField("Email", text: .constant(""))
                    .keyboardType(.emailAddress)
            }
            Section("Billing Address") {
                TextField("Address", text: .constant(""))
                    .keyboardType(.namePhonePad)
                TextField("City", text: .constant(""))
                    .keyboardType(.namePhonePad)
                TextField("State", text: .constant(""))
                    .keyboardType(.namePhonePad)
                TextField("Zip", text: .constant(""))
                    .keyboardType(.namePhonePad)
            }
            Section("Notes") {
                TextField("",
                          text: .constant(""),
                          axis: .vertical)
                    
            }
        }
        .navigationTitle("New Client")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
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
            CreateContactView()
        }
    }
}
