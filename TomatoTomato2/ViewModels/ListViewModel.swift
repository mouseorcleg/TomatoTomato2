//
//  ListViewModel.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 09/01/2023.
//

import Foundation
import SwiftUI
import Combine

class ListViewModel: ObservableObject {
    
    @Published var dbTasks: [TomatoTaskModel] = []
    @Published var tomatoTasks: [TomatoTaskModel] = []
    
    let tasksKey: String = "tasks_list"
    
    @Published var alertTitle: String = ""
    @Published var showAlert: Bool = false
    
    @Published var textFieldText: String = ""
    @Published var sizePickerSelection: String = "L"
    @Published var typePickerSelection: String = ""
    
    var sizePickerOptions: [String] = ["XS", "S", "M", "L", "XL"]
    var typePickerOptions: [String] = ["mail", "develop", "launch", "meet", "", "plan", "research", "review", "test"]
    
    private let tomatoDBService = TomatoDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadYourTasks()
    }
    
    func loadYourTasks() {
        $tomatoTasks
            .combineLatest(tomatoDBService.$savedEntities)
            .map { taskModels, taskEntities -> [TomatoTaskModel] in
                
                taskModels
                    .compactMap { (tomatoTask) -> TomatoTaskModel? in
                        guard let entity = taskEntities.first(where: { $0.id == tomatoTask.id }) else {
                            return nil
                        }
        // TODO: double check the logic here
        //for now it updates the task in vm array with data from db
                        return tomatoTask.updateMeFromDB(from: entity)
                    }
            }
            .sink { [weak self] (returnedTasks) in
                self?.dbTasks = returnedTasks
            }
            .store(in: &cancellables)
    }
    
    func updateTomatoDB(model: TomatoTaskModel) {
        tomatoDBService.updateTomatoDB(updateFrom: model)
    }
        
    func addTask(title: String, size: String, type: String) {
        let newTask = TomatoTaskModel(title: title, size: size, type: type, isCompleted: false)
        tomatoTasks.append(newTask)
    }
    
    func getTestTasks() {
        let testItems = [
            TomatoTaskModel(title: "Sleep", size: "XL", type: "research", isCompleted: true),
            TomatoTaskModel(title: "Breakfast", size: "S", type: "develop", isCompleted: false),
            TomatoTaskModel(title: "Go for a walk", size: "M", type: "plan", isCompleted: false)
        ]
        tomatoTasks.append(contentsOf: testItems)
    }
    
    func deleteTask(indexSet: IndexSet) {
        tomatoTasks.remove(atOffsets: indexSet)
//TODO: figure out the logic here
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tomatoTasks.move(fromOffsets: from, toOffset: to)
    }
    
    func updateTaskCompletion(task: TomatoTaskModel) {
        
        if let index = tomatoTasks.firstIndex(where: { $0.id == task.id}) {
            tomatoTasks[index] = task.updateCompletion()
            tomatoDBService.updateTomatoDB(updateFrom: task.updateCompletion())
        }
    }
    
//    func saveTasks() {
//        if let encodedData = try? JSONEncoder().encode(tomatoTasks) {
//            UserDefaults.standard.set(encodedData, forKey: tasksKey)
//        }
//    }
    
    func addTomatoTask(title: String, size: String, type: String) {
        let newTask = TomatoTaskModel(title: title, size: size, type: type, isCompleted: false)
        tomatoTasks.append(newTask)
        tomatoDBService.updateTomatoDB(updateFrom: newTask)
    }
    
    func thereIsTheTitle() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Title of your task should be at least 3 characters long. Type it up 🦾"
            //can add other checks here
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}
