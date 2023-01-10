//
//  TaskModel.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import Foundation

//Immutable struct - use let so the data can't be changed easily

struct TomatoTaskModel: Identifiable {
    let id: String
    let title: String
    let size: String
    let type: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, size: String, type: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.size = size
        self.type = type
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TomatoTaskModel {
        return TomatoTaskModel(id: id, title: title, size: size, type: type, isCompleted: !isCompleted)
    }
}
// NB - update the model only through here!

//potentially you can add Color and dueDate to this model
