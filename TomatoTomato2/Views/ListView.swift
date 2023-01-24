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
        
        ZStack {
            if listViewModel.tomatoTasks.isEmpty {
                Text("No items")
            } else {
                List {
                    ForEach(listViewModel.tomatoTasks) { tomatoTask in
                        NavigationLink {
                            TaskDetailView(tomatoTask: tomatoTask)
                        } label: {
                            CellListView(task: tomatoTask)
                                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                    Button {
                                        withAnimation(.linear) {
                                            listViewModel.updateTaskCompletion(task: tomatoTask)
                                        }
                                    } label: {
                                        Label("Done?", systemImage: "checkmark")
                                    }
                                    .tint(Color.theme.accent)
                                }
                        }
                    }
                    .onDelete(perform: listViewModel.deleteTomatofromDB)
                    .onMove(perform: listViewModel.moveTask)
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
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
