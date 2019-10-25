//
//  TaskEditingView.swift
//  TaskList
//
//  Created by itsector on 24/10/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

import SwiftUI

struct TaskEditingView: View {
    @Binding var task: Task
    var body: some View {
        Form {
            TextField("Name", text: $task.name)
            Toggle("Completed", isOn: $task.completed)
        }
    }
}

struct TaskEditingView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEditingView(task: .constant(Task(name: "To Do")))
    }
}
