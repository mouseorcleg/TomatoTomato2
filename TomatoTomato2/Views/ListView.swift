//
//  ListView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

struct ListView: View {
    
    @State var tasks: [String] = [
        "First task",
        "Second task",
        "Third task"
    ]
    
    var body: some View {
        
        List {
            ForEach(tasks, id: \.self) { task in
                CellListView(title: task)
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("📌 To do:")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
