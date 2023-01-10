//
//  TaskModel.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import Foundation

struct TomatoTaskModel: Identifiable {
    var id: String
    var title: String
    var size: String
    var type: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, size: String, type: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.size = size
        self.type = type
        self.isCompleted = isCompleted
    }
}

//potentially you can add Color and dueDate to this model
