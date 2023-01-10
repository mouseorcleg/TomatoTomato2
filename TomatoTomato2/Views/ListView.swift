//
//  ListView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        List {
            ForEach(listViewModel.tasks) { task in
                CellListView(task: task)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateTaskCompletion(task: task)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteTask)
            .onMove(perform: listViewModel.moveTask)
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
        .environmentObject(ListViewModel())
    }
}
