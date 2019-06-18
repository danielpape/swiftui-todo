//
//  Task.swift
//  todo
//
//  Created by Daniel Pape on 16/06/2019.
//  Copyright © 2019 Daniel Pape. All rights reserved.
//

import SwiftUI

struct Task : Identifiable {
    var id = UUID()
    var name: String
    var subtasks: Int
    var complete: Bool
    var hasVideo: Bool = false
    
    var imageName: String { return name }
    var thumbnailName:String {return name + "Thumb"}
}

#if DEBUG

let testData = [
    Task(name:"Buy Milk", subtasks:20, complete: false),
    Task(name:"Design App", subtasks:12, complete: true),
    Task(name:"Complete 10,000 steps", subtasks:6, complete: false),
    Task(name:"Take out rubbish", subtasks:3, complete: true),
    Task(name:"Call Mum", subtasks:8, complete: false)
    
]

#endif
