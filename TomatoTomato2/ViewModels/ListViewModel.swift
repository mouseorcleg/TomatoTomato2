//
//  ListViewModel.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 09/01/2023.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    
    @Published var tasks: [TomatoTaskModel] = []
//    {
//        didSet {
//            saveTasks()
//        }
//    }
//    let tasksKey: String = "tasks_list"
    
    @Published var alertTitle: String = ""
    @Published var showAlert: Bool = false
    
    @Published var textFieldText: String = ""
    @Published var sizePickerSelection: String = "L"
    @Published var typePickerSelection: String = ""
    
    var sizePickerOptions: [String] = ["XS", "S", "M", "L", "XL"]
    var typePickerOptions: [String] = ["mail", "develop", "launch", "meet", "", "plan", "research", "review", "test"]
    
    init() {
//        getYourTasks()
    }
    
//    func getTestTasks() {
//        let testItems = [
//            TomatoTaskModel(title: "Sleep", size: "XL", type: "research", isCompleted: true),
//            TomatoTaskModel(title: "Breakfast", size: "S", type: "develop", isCompleted: false),
//            TomatoTaskModel(title: "Go for a walk", size: "M", type: "plan", isCompleted: false)
//        ]
//        tasks.append(contentsOf: testItems)
//    }
    
//    func getYourTasks() {
//        guard
//            let data = UserDefaults.standard.data(forKey: tasksKey),
//            let savedTasks = try? JSONDecoder().decode([TomatoTaskModel].self, from: data)
//        else { return }
//        self.tasks = savedTasks
//    }
    
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func updateTaskCompletion(task: TomatoTaskModel) {
        
        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks[index] = task.updateCompletion()
        }
    }
    
//    func saveTasks() {
//        if let encodedData = try? JSONEncoder().encode(tasks) {
//            UserDefaults.standard.set(encodedData, forKey: tasksKey)
//        }
//    }
    
    func addTask(title: String, size: String, type: String) {
        let newTask = TomatoTaskModel(title: title, size: size, type: type, isCompleted: false)
        tasks.append(newTask)
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
