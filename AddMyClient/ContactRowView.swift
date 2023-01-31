//
//  ContactRowView.swift
//  AddMyClient
//
//  Created by Richard Garrison on 1/28/23.
//

import SwiftUI

struct ContactRowView: View {
    var body: some View {
        
        VStack {
            Text("Name")
                .font(.system(size: 26, design: .rounded).bold())
        }
        .padding(5)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(alignment: .topTrailing) {
            Button {
                
            } label: {
                Image(systemName: "star")
                    .font(.title3)
                    .symbolVariant(.fill)
                    .foregroundColor(.gray.opacity(0.3))
            }
            .buttonStyle(.plain)
        }
    }
}

struct ContactRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContactRowView()
    }
}
