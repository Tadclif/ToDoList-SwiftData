//
//  ContentView.swift
//  ToDoList
//
//  Created by Tad Clifton on 10/15/24.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @Query var toDos: [ToDo]
    @State private var sheetisPresented = false
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos) { toDo in
                    VStack {
                        HStack {
                            Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                                .onTapGesture {
                                    toDo.isCompleted.toggle()
                                    guard let _ = try? modelContext.save() else {
                                        print("error saving")
                                        return
                                    }
                                }
                            NavigationLink {
                                DetailView(toDo: toDo)
                            } label: {
                                Text(toDo.item)
                            }
                            .font(.title2)
                            .swipeActions {
                                Button("Delete", role: .destructive){
                                    modelContext.delete(toDo)
                                    guard let _ = try? modelContext.save() else {
                                        print("error saving")
                                        return
                                    }
                                }
                                
                            }
                        }
                        .font(.title2)
                        
                        HStack {
                            Text(toDo.dueDate.formatted(date: .abbreviated, time: .shortened))
                                .foregroundStyle(.secondary)
                            
                            if toDo.reminderIsOn {
                                Image(systemName: "calendar.badge.clock")
                                    .symbolRenderingMode(.multicolor)
                            }
                        }
                    }
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .sheet(isPresented: $sheetisPresented) {
                NavigationStack{
                    DetailView(toDo: ToDo())
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        sheetisPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            
        }
    }
}

#Preview {
    ToDoListView()
        .modelContainer(ToDo.preview)
}
