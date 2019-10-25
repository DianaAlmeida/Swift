//
//  TaskStore.swift
//  TaskList
//
//  Created by itsector on 24/10/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

import Combine

class TaskStore: ObservableObject {
//    var task = Task(name: "Code a SwiftUI app")
//    @Published var tasks = ["Book an escape room",
//                            "Walk the cat",
//                            "Code a SwiftUI app",
//                            "Pick up heavy things and put them down",
//                            "Make karaoke playlist",
//                            "Present at iOS meetup group",
//                            "Climb El Capitan",
//                            "Learn to make baklava",
//                            "Play disc golf in every state",
//                            "100 moview reboot marathon"
//        ].map { Task(name: $0) }
    
    @Published var prioritizedTasks = [
        PrioritizedTasks(
            priority: .high,
            names: [
                "Book an escape room",
                "Walk the cat",
                "Code a SwiftUI app",
                "Pick up heavy things and put them down"
            ]
        ),
        PrioritizedTasks(
            priority: .medium,
            names: [
                "Make karaoke playlist",
                "Present at iOS meetup group",
                "Climb El Capitan"
            ]
        ),
        PrioritizedTasks(
            priority: .low,
            names: [
                "Learn to make baklava",
                "Play disc golf in every state"
            ]
        ),
        PrioritizedTasks(
            priority: .no,
            names: ["100 moview reboot marathon"
            ]
        )
    ]
    
    func getIndex(for priority: Task.Priority) -> Int {
        prioritizedTasks.firstIndex { $0.priority == priority }!
    }
}

private extension TaskStore.PrioritizedTasks {
    init(priority: Task.Priority, names: [String]) {
        self.init(
            priority: priority,
            tasks: names.map { Task(name: $0)}
        )
    }
}
