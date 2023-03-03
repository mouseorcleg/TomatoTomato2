//
//  ListView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var repo: DataRepository
    @ObservedObject var addVM = AddViewModel()
    
    var body: some View {
        
        ZStack {
            if repo.tomatoTasks.isEmpty {
                NoTasksView(addVM: addVM)
            } else {
                List {
                    ForEach(repo.tomatoTasks) { tomatoTask in
                        let editVM = EditViewModel(tomatoTask: tomatoTask)
                        NavigationLink {
                            TaskDetailView(tomatoTask: tomatoTask, editVM: editVM)
                        } label: {
                            CellListView(task: tomatoTask)
                                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                    Button {
                                        withAnimation(.linear) {
                                            repo.updateTaskCompletion(task: tomatoTask)
                                        }
                                    } label: {
                                        Label("Done?", systemImage: "checkmark")
                                    }
                                    .tint(Color.theme.accent)
                                }
                        }
                    }
                    .onDelete(perform: repo.deleteTomatofromDB)
                    .onMove(perform: repo.moveTask)
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationTitle("📌 To do:")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView(addVM: addVM))
        )
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(DataRepository())
    }
}
