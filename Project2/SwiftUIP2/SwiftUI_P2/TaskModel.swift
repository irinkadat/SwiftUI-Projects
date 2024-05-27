//
//  TaskModel.swift
//  SwiftUI_P2
//
//  Created by Irinka Datoshvili on 24.05.24.
//

import Foundation

// MARK: - Task Model

struct Task: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    var isCompleted: Bool
}

var tasksList: [Task] = [
    Task(title: "Mobile App Research", date: "4 Oct", isCompleted: true),
    Task(title: "Prepare Wireframe for Main Flow", date: "4 Oct", isCompleted: true),
    Task(title: "Prepare Screens", date: "4 Oct", isCompleted: true),
    Task(title: "Website Research", date: "5 Oct", isCompleted: false),
    Task(title: "Prepare Wireframe for Main Flow", date: "5 Oct", isCompleted: false),
    Task(title: "Prepare Screens", date: "5 Oct", isCompleted: false)
]
