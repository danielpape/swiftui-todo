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
                    Button(action: addTask){
                        Text("Add Task")
                    }
                }
                
                Section {
                    ForEach(store.tasks) { task in
                        TaskCell(task: task)
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    }
                }
                .navigationBarTitle(Text("Tasks"))
                .navigationBarItems(trailing: EditButton())
                .listStyle(.grouped)
            }
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
        return NavigationButton(destination:TaskDetail(task:task)){
            if task.complete{
                Image(systemName: "checkmark")
            }
            VStack(alignment: .leading) {
                Text(task.name)
                Text("\(task.subtasks) subtasks")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
