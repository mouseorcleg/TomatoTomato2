//
//  ListView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

struct ListView: View {
    
    @State var tasks: [TomatoTaskModel] = [
        TomatoTaskModel(title: "Sleep", size: "XL", type: "Research", isCompleted: true),
        TomatoTaskModel(title: "Breakfast", size: "S", type: "Develop", isCompleted: false),
        TomatoTaskModel(title: "Go for a walk", size: "M", type: "Plan", isCompleted: false)
        
    ]
    
    var body: some View {
        
        List {
            ForEach(tasks) { task in
//                CellListView(title: task)
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
