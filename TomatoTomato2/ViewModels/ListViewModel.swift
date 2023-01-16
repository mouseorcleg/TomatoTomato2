//
//  ListViewModel.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 09/01/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var tomatoTasks: [TomatoTaskModel] = []
    
    private let tomatoDBService = TomatoDataService()
    
    init() {
        loadYourTasks2()
    }
    
    func loadYourTasks2() {
        let tasksFromDB = tomatoDBService.savedEntities
        
        for task in tasksFromDB {
            let newModel = TomatoTaskModel.fromDB(model: task)
            tomatoTasks.append(newModel)
            }
        }
    
    func updateTomatoDB(model: TomatoTaskModel) {
        tomatoDBService.updateMyTomatoDB(updateFrom: model)
    }
        
    func addTomatoTask(title: String, size: String, type: String) {
        let newTask = TomatoTaskModel(title: title, size: size, type: type, isCompleted: false)
        tomatoTasks.append(newTask)
        updateTomatoDB(model: newTask)
    }
    
    func deleteTask(indexSet: IndexSet) {
        let model = tomatoTasks[indexSet.first!]
        tomatoDBService.goodbyeTask(model: model)
        tomatoTasks.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tomatoTasks.move(fromOffsets: from, toOffset: to)
    }
    
    func updateTaskCompletion(task: TomatoTaskModel) {
        
        if let index = tomatoTasks.firstIndex(where: { $0.id == task.id}) {
            tomatoTasks[index] = task.updateCompletion()
            updateTomatoDB(model: tomatoTasks[index])
        }
    }
    
    
    
    
}
