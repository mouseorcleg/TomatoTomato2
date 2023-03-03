//
//  DataRepository.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 09/01/2023.
//

import Foundation

class DataRepository: ObservableObject {
    
    @Published var tomatoTasks: [TomatoTaskModel] = []
    
    private let tomatoDBService = TomatoDataService()
    
    init() {
        reloadYourTasks()
    }
    
    //MARK: basic functions to update db
    
    func reloadYourTasks() {
        let tasksFromDB = tomatoDBService.savedEntities.map { TomatoTaskModel.fromDB(model: $0) }
        tomatoTasks = tasksFromDB
    }
    
    func updateTaskInDB(model: TomatoTaskModel) {
        tomatoDBService.updateTask(model: model)
        reloadYourTasks()
    }
    
    func deleteTomatofromDB(indexSet: IndexSet) {
        tomatoDBService.goodbyeTask(indexSet: indexSet)
        reloadYourTasks()
    }
    
    //MARK: functions to work with models for the updates to db
    
    func addTomatoTask(title: String, size: String, type: String) {
        updateTaskInDB(model: TomatoTaskModel(
            id: UUID(),
            title: title,
            size: size,
            type: type,
            isCompleted: false,
            tomatoCount: 0))
    }
    
    func updateTaskCompletion(task: TomatoTaskModel) {
        if let index = tomatoTasks.firstIndex(where: { $0.id == task.id}) {
            tomatoTasks[index] = task.updateCompletion()
            let updateModel = tomatoTasks[index]
            updateTaskInDB(model: updateModel)
        }
    }
    
    //MARK: Last function without connection to db
    
    func moveTask(from: IndexSet, to: Int) {
        tomatoTasks.move(fromOffsets: from, toOffset: to)
    }
}
