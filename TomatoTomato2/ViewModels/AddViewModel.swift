//
//  AddViewModel.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 20/02/2023.
//

import Foundation
import SwiftUI

class AddViewModel: ObservableObject {
    
    @Published var alertTitle: String = ""
    @Published var showAlert: Bool = false
    
    @Published var textFieldText: String = ""
    @Published var sizePickerSelection: String = "M"
    @Published var typePickerSelection: String = "none"
    
    
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
