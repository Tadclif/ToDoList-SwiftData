//
//  ContentView.swift
//  ToDoList
//
//  Created by Tad Clifton on 10/15/24.
//

import SwiftUI

struct ToDoListView: View {
    var toDos = ["Learn Swift", "Build Apps", "Change the World", "Bring the Awesome", "Take a Vacation"]
    var body: some View {
        NavigationStack{
            List{
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink{
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }
                }
            }
            .navigationTitle("To Do list")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
        
    }
}

#Preview {
    ToDoListView()
}
