//
//  ListView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "First task",
        "Second task",
        "Third task"
    ]
    
    var body: some View {
        
        List {
            ForEach(items, id: \.self) { item in
                CellListView(title: item)
            }
        }
        .navigationTitle("📌 To do:")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: Text("Edit screen"))
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
