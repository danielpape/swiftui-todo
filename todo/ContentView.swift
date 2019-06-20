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
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(store.tasks) { task in
                        TaskCell(task: task)
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    }
                Section {
                    NavigationButton(destination: AddTaskView()){
                        Text("Add Task")
                    }
                }
                }
            }
            .navigationBarTitle(Text("Tasks"))
            .listStyle(.grouped)
        }
    
    func addTask() {
        store.tasks.append(Task(name: "Code App", subtasks: 5, complete: false))
    }
    
    func delete(at offsets: IndexSet) {
        offsets.sorted { $0 > $1 }.forEach { store.tasks.remove(at: $0) }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        source.sorted { $0 > $1 }.forEach { store.tasks.insert(store.tasks.remove(at: $0), at: destination) }
    }
    
    func tapCell(id:Int){
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
