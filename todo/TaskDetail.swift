//
//  TaskDetail.swift
//  todo
//
//  Created by Daniel Pape on 18/06/2019.
//  Copyright © 2019 Daniel Pape. All rights reserved.
//

import SwiftUI

struct TaskDetail : View {
    let task:Task
    @State var text: String = ""
    
    var body: some View {
        VStack {
            TextField($text,
                      placeholder: Text("Type in a task")).textFieldStyle(.roundedBorder)
            Button(action: {
                print(self.$text)
            }) {
                Text("SEND")
            }
        }.navigationBarTitle(Text("Add a task"))
    }
}

#if DEBUG
struct TaskDetail_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {TaskDetail(task: testData[0]) }
    }
}
#endif
