//
//  Task.swift
//  TaskList
//
//  Created by itsector on 24/10/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    
    var name: String
    var completed = false
}
