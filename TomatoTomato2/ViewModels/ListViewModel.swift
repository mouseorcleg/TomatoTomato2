//
//  ListViewModel.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 09/01/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var tasks: [TomatoTaskModel] = []
    
    init() {
        getTestTasks()
    }
    
    func getTestTasks() {
        let testItems = [
            TomatoTaskModel(title: "Sleep", size: "XL", type: "research", isCompleted: true),
            TomatoTaskModel(title: "Breakfast", size: "S", type: "develop", isCompleted: false),
            TomatoTaskModel(title: "Go for a walk", size: "M", type: "plan", isCompleted: false)
        ]
        tasks.append(contentsOf: testItems)
    }
    
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func addTask(title: String, size: String, type: String) {
        let newTask = TomatoTaskModel(title: title, size: size, type: type, isCompleted: false)
        tasks.append(newTask)
    }
    
    func updateTaskCompletion(task: TomatoTaskModel) {
        if let index = tasks.firstIndex { (existingTask) -> Bool in
            return existingTask.id == task.id
        } {
            // run the code
        }
    }
    
}
