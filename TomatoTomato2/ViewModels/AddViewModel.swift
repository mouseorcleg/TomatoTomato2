//
//  AddViewModel.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 14/02/2023.
//

import Foundation
import SwiftUI

class AddViewModel: ObservableObject {
    
    @EnvironmentObject var dataRepo: DataRepo
    @Environment(\.presentationMode) var presentationMode
    
    @Published var alertTitle: String = ""
    @Published var showAlert: Bool = false
    
    @Published var textFieldText: String = ""
    
    @Published var sizePickerOptions: TomatoSize
    @Published var typePickerOptions: TomatoType
    
    init(sizePickerOptions: TomatoSize = TomatoSize.L, typePickerOptions: TomatoType = TomatoType.usual) {
        self.sizePickerOptions = sizePickerOptions
        self.typePickerOptions = typePickerOptions
    }
    
    func savedButtonPressed() {
        if thereIsTheTitle() {
            
            dataRepo.addTomatoTask(title: textFieldText, size: sizePickerOptions.name, type: typePickerOptions.name)
            
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func thereIsTheTitle() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Title of your task should be at least 3 characters long. Type it up 🦾"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}


