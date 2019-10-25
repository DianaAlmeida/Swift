//
//  RowView.swift
//  TaskList
//
//  Created by itsector on 24/10/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @Binding var task: Task
    
    let checkmark = Image(systemName: "checkmark")
    
    
    var body: some View {
        NavigationLink(destination: TaskEditingView(task: $task)
        ) {
            if task.completed {
                checkmark
            } else {
                checkmark.hidden()
            }
            Text(task.name)
                .strikethrough(task.completed)
        }
        
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(
            task: .constant( Task(name: "To Do") )
        )
    }
}
