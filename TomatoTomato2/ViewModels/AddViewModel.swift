//
//  AddViewModel.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 10/01/2023.
//

import Foundation
import SwiftUI

class AddViewModel: ObservableObject {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @Published var alertTitle: String = ""
    @Published var showAlert: Bool = false
    
    @Published var textFieldText: String = ""
    @Published var sizePickerSelection: String = "L"
    @Published var typePickerSelection: String = ""
    
    var sizePickerOptions: [String] = ["XS", "S", "M", "L", "XL"]
    var typePickerOptions: [String] = ["mail", "develop", "launch", "meet", "", "plan", "research", "review", "test"]
    
    func addTask(title: String, size: String, type: String) {
        let newTask = TomatoTaskModel(title: title, size: size, type: type, isCompleted: false)
        listViewModel.tasks.append(newTask)
    }
    
    func savedButtonPressed() {
        if thereIsTheTitle() {
            addTask(title: textFieldText, size: sizePickerSelection, type: typePickerSelection)
            presentationMode.wrappedValue.dismiss()
        }
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
