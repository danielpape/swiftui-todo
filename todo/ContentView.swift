//
//  ContentView.swift
//  todo
//
//  Created by Daniel Pape on 12/06/2019.
//  Copyright © 2019 Daniel Pape. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @ObjectBinding var store = TaskStore()
    @State var isPresented = false
    @State var taskTitle: String = ""
    @State var taskTag = 0
    
    var tags = ["Personal","Professional"]
    
    
    var modalPresentation: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")){
                    TextField($taskTitle, placeholder: Text("Enter your task title"))
                    Picker(selection: $taskTag, label: Text("Tag")) {
                        ForEach(0 ..< tags.count) {
                            Text(self.tags[$0]).tag($0)
                        }
                    }
                }
                Section {
                    Button(
                        action: {
                            self.isPresented = false
                            self.addTask()
                    },
                        label: { Text("Add Task") }
                    )
                }
                }
                .listStyle(.grouped)
                .navigationBarTitle(Text("Add Task"))
                .navigationBarItems(trailing:
                    Button(action: { self.isPresented = false }) { Text("Close") })
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Personal")){
                    ForEach(store.tasks) { task in
                        if(self.taskTag == 0){
                            TaskCell(task: task)
                        }
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    
                }
                Section(header: Text("Work")){
                    ForEach(store.tasks) { task in
                        if(self.taskTag == 1){
                            TaskCell(task: task)
                        }
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    
                }
                }.listStyle(.grouped)
                .navigationBarTitle(Text("Tasks"))
                .navigationBarItems(trailing:
                    Button(action: { self.isPresented = true }) { Text("Add Task") })
            }
            .presentation( isPresented ? Modal(modalPresentation, onDismiss: { self.isPresented.toggle() }) : nil )
    }
    func addTask() {
        store.tasks.append(Task(name: $taskTitle.value, tag: $taskTag.value, complete: false))
        $taskTitle.value = ""
    }
    
    func delete(at offsets: IndexSet) {
        offsets.sorted { $0 > $1 }.forEach { store.tasks.remove(at: $0) }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        source.sorted { $0 > $1 }.forEach { store.tasks.insert(store.tasks.remove(at: $0), at: destination) }
    }
    
    func tapCell(){
        print("tap cell")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(store: TaskStore(tasks: testData))
    }
}
#endif

struct TaskCell : View {
    let task: Task
    
    var body: some View {
        return
            VStack(alignment: .leading) {
                Text(task.name)
        }
    }
}
