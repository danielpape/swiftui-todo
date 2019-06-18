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
    @State private var zoomed = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
            .navigationBarTitle(Text(task.name))
    }
}

#if DEBUG
struct TaskDetail_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {TaskDetail(task: testData[0]) }
    }
}
#endif
