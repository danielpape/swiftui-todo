//
//  TaskStore.swift
//  todo
//
//  Created by Daniel Pape on 18/06/2019.
//  Copyright © 2019 Daniel Pape. All rights reserved.
//

import SwiftUI
import Combine

class TaskStore : BindableObject {
    var tasks: [Task] {
        didSet { didChange.send(()) }
    }
    
    init (tasks: [Task] = []) {
        self.tasks = tasks
    }
    
    var didChange = PassthroughSubject<Void, Never>()
}
