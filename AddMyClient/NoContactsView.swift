//
//  NoContactView.swift
//  AddMyClient
//
//  Created by Richard Garrison on 2/5/23.
//

import SwiftUI

struct NoContactsView: View {
    var body: some View {
        VStack {
            Text("👀 No Clients")
                .font(.largeTitle.bold())
            Text("Seems a lil' empty here, create some clients ☝️")
                .font(.callout)
        }
    }
}

struct NoContactView_Previews: PreviewProvider {
    static var previews: some View {
        NoContactsView()
    }
}
