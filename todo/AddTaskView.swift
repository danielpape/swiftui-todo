//
//  AddTaskView.swift
//  todo
//
//  Created by Daniel Pape on 20/06/2019.
//  Copyright © 2019 Daniel Pape. All rights reserved.
//

import SwiftUI

struct AddTaskView : View {
    @State var taskTitle: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Task Details")){
                    TextField($taskTitle, placeholder: Text("Enter your task title"))
                    NavigationButton(destination: AddTagView()){
                        Text("Add Tag")
                            .color(.gray)
                    }
                }
                Section {
                    Button(
                        action: AddTask,
                        label: { Text("Add Task") }
                    )
                }
            }
            .listStyle(.grouped)
        }
    }
    
    func AddTask() {

    }
    
}

#if DEBUG
struct AddTaskView_Previews : PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
#endif
