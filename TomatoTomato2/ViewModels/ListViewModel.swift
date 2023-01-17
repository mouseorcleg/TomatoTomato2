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
        cleanUpTomatoTasks()
        loadYourTasks2()
    }
    
    func loadYourTasks2() {
        let tasksFromDB = tomatoDBService.savedEntities
        
        for task in tasksFromDB {
            let newModel = TomatoTaskModel.fromDB(model: task)
            tomatoTasks.append(newModel)
            }
        }
    
    func cleanUpTomatoTasks() {
        tomatoTasks.removeAll()
    }
    
    func createTaskInDB(model: TomatoTaskModel) {
        tomatoDBService.helloTask(model: model)
    }
    
    func updateTaskInDB(model: TomatoTaskModel) {
        tomatoDBService.howAreYouTask(model: model)
    }
    
    func deleteTomatofromDB(indexSet: IndexSet) {
        tomatoDBService.goodbyeTask(indexSet: indexSet)
    }
        
    func addTomatoTask(title: String, size: String, type: String) {
        let newTask = TomatoTaskModel(id: UUID(), title: title, size: size, type: type, isCompleted: false)
        tomatoTasks.append(newTask)
        createTaskInDB(model: newTask)
    }
    
    func deleteTask(indexSet: IndexSet) {
        deleteTomatofromDB(indexSet: indexSet)
        tomatoTasks.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tomatoTasks.move(fromOffsets: from, toOffset: to)
    }
    
    func updateTaskCompletion(task: TomatoTaskModel) {
        
        if let index = tomatoTasks.firstIndex(where: { $0.id == task.id}) {
            tomatoTasks[index] = task.updateCompletion()
            let updateModel = tomatoTasks[index]
            updateTaskInDB(model: updateModel)
            
        }
    }
    
    
    
    
}
