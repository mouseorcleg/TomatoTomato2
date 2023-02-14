//
//  ListView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var dataRepo: DataRepo
    
    var body: some View {
        
        ZStack {
            if dataRepo.tomatoTasks.isEmpty {
                NoTasksView()
            } else {
                List {
                    ForEach(dataRepo.tomatoTasks) { tomatoTask in
                        NavigationLink {
                            TaskDetailView(tomatoTask: tomatoTask)
                        } label: {
                            CellListView(task: tomatoTask)
                                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                    Button {
                                        withAnimation(.linear) {
                                            dataRepo.updateTaskCompletion(task: tomatoTask)
                                        }
                                    } label: {
                                        Label("Done?", systemImage: "checkmark")
                                    }
                                    .tint(Color.theme.accent)
                                }
                        }
                    }
                    .onDelete(perform: dataRepo.deleteTomatofromDB)
                    .onMove(perform: dataRepo.moveTask)
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
        .environmentObject(DataRepo())
    }
}
