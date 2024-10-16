//
//  ToDo.swift
//  ToDoList
//
//  Created by Tad Clifton on 10/16/24.
//

import Foundation
import SwiftData

@MainActor
@Model
class ToDo {
    var item: String = ""
    var reminderIsOn = false
    var notes = ""
    var dueDate = Date.now + 60*60*24
    var isCompleted = false
    
    init(item: String = "", reminderIsOn: Bool = false, notes: String = "", dueDate: Date = Date.now + 60*60*24, isCompleted: Bool = false) {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.notes = notes
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
}

extension ToDo {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        container.mainContext.insert(ToDo(item: "Create SwiftData Lessons", reminderIsOn: true,
                                          notes: "Now with iOS 16 & Xcode 18",dueDate: Date.now + 60*60*24,  isCompleted: false))
        
        container.mainContext.insert(ToDo(item: "Macedonian Educators Talk", reminderIsOn: true, notes: "They want to learn about entrepreneurship", dueDate: Date.now + 60*60*48, isCompleted: false))
        
        container.mainContext.insert(ToDo(item: "Post Flyers for Swift in Santiago", reminderIsOn: true,
                                          notes: "To be held at UAH", dueDate: Date.now + 60*60*72,isCompleted: false))
        
        container.mainContext.insert(ToDo(item: "Prepare old iPhone for Lily", reminderIsOn: true,
                                          notes: "She gets a Pro!",
                                          dueDate: Date.now + 60*60*12,  isCompleted: false))
        
        return container
    }
}

