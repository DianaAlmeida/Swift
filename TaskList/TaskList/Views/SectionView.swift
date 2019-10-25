//
//  SectionView.swift
//  TaskList
//
//  Created by itsector on 24/10/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

import SwiftUI

struct SectionView: View {
    @Binding var prioritizedTasks: TaskStore.PrioritizedTasks
    var body: some View {
        Section(
            header: Text(
                "\(prioritizedTasks.priority.rawValue.capitalized) Priority"
            )
        ) {
            ForEach(prioritizedTasks.tasks) { index in
                RowView(task: self.$prioritizedTasks.tasks[index])
            }
            .onMove { sourceIndices, destinationIndex in
                self.prioritizedTasks.tasks.move(
                    fromOffsets: sourceIndices,
                    toOffset: destinationIndex
                )
            }
            .onDelete { indexSet in
                self.prioritizedTasks.tasks.remove(atOffsets: indexSet)
            }
            
        }
    }
}


