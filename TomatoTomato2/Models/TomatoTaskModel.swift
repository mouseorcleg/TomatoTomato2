//
//  TaskModel.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import Foundation

//Immutable struct - use let so the data can't be changed easily

struct TomatoTaskModel: Identifiable, Codable {
    let id: UUID
    let title: String
    let size: String
    let type: String
    let isCompleted: Bool
    
    init(id: UUID, title: String, size: String, type: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.size = size
        self.type = type
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TomatoTaskModel {
        return TomatoTaskModel(id: id, title: title, size: size, type: type, isCompleted: !isCompleted)
    }
    
    static func from(from: TomatoTaskModel) -> TomatoTaskModel {
        return TomatoTaskModel(id: from.id, title: from.title, size: from.size, type: from.type, isCompleted: from.isCompleted)
    }
    
    static func fromDB(model: TomatoTaskEntity) -> TomatoTaskModel {
        return TomatoTaskModel(id: model.tomatoID!, title: model.title!, size: model.size ?? "", type: model.type ?? "", isCompleted: model.isCompleted)
    }
}
// NB - update the model only through here!

//potentially you can add Color and dueDate to this model
