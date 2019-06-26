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
    var tag: Int
    var complete: Bool
}

#if DEBUG

let testData = [
    Task(name: "Walk Dog", tag: 0, complete: false)
]

#endif
