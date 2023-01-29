//
//  ContentView.swift
//  AddMyClient
//
//  Created by Richard Garrison on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach((0...8), id: \.self) { item in
                    
                    VStack {
                        Text("Name")
                            .font(.system(size: 26, design: .rounded).bold())
                    }
                    .padding()
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
