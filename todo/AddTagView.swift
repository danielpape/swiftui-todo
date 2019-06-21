//
//  AddTagView.swift
//  todo
//
//  Created by Daniel Pape on 21/06/2019.
//  Copyright © 2019 Daniel Pape. All rights reserved.
//

import SwiftUI

struct AddTagView : View {
    var body: some View {
        NavigationView{
            List {
                Section{
                    Text("Tag 1")
                    Text("Tag 2")
                    Text("Tag 3")
                    Text("Tag 4")
                    Text("Tag 5")
                    Text("Tag 6")
                    Text("Tag 7")
                }
            }
        }.navigationBarTitle(Text("Tags"))
    }
}

#if DEBUG
struct AddTagView_Previews : PreviewProvider {
    static var previews: some View {
        AddTagView()
    }
}
#endif
