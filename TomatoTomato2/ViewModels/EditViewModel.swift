//
//  EditViewModel.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 23/02/2023.
//

import Foundation
import SwiftUI

class EditViewModel: ObservableObject {
    
    var tomatoTask: TomatoTaskModel
    
    @Published var showDialog: Bool = false
    @Published var alertTitle: String = ""
    @Published var showAlert: Bool = false
    
    @Published var textFieldText: String
    @Published var sizePickerSelection: String
    @Published var typePickerSelection: String
    
    init(tomatoTask: TomatoTaskModel) {
        self.tomatoTask = tomatoTask
        self.textFieldText = tomatoTask.title
        self.sizePickerSelection = tomatoTask.size
        self.typePickerSelection = tomatoTask.type
    }
    
    func thereIsTheTitle() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Title of your task should be at least 3 characters long. Type it up 🦾"
            //can add other checks here
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}
