//
//  ListView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

struct ListView: View {
    
    @State var tasks: [TomatoTaskModel] = [
        TomatoTaskModel(title: "Sleep", size: "XL", type: "research", isCompleted: true),
        TomatoTaskModel(title: "Breakfast", size: "S", type: "develop", isCompleted: false),
        TomatoTaskModel(title: "Go for a walk", size: "M", type: "plan", isCompleted: false)
        
    ]
    
    var body: some View {
        
        List {
            ForEach(tasks) { task in
                CellListView(task: task)
            }
            .onDelete(perform: deleteTask)
            .onMove(perform: moveTask)
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("📌 To do:")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
    
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
