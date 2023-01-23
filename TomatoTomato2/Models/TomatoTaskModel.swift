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
    var tomatoCount: Int
    
    init(id: UUID, title: String, size: String, type: String, isCompleted: Bool, tomatoCount: Int) {
        self.id = id
        self.title = title
        self.size = size
        self.type = type
        self.isCompleted = isCompleted
        self.tomatoCount = tomatoCount
    }
    
    func updateCompletion() -> TomatoTaskModel {
        return TomatoTaskModel(id: id, title: title, size: size, type: type, isCompleted: !isCompleted, tomatoCount: tomatoCount)
    }
    
    func plusOneTomato() -> TomatoTaskModel {
        return TomatoTaskModel(id: id, title: title, size: size, type: type, isCompleted: !isCompleted, tomatoCount: tomatoCount + 1)
    }
    
    static func fromEdit(model: TomatoTaskModel, title: String, size: String, type: String) -> TomatoTaskModel {
        let newModel = TomatoTaskModel(id: model.id, title: title, size: size, type: type, isCompleted: model.isCompleted, tomatoCount: model.tomatoCount)
        return newModel
    }
    
    static func from(from: TomatoTaskModel) -> TomatoTaskModel {
        return TomatoTaskModel(id: from.id, title: from.title, size: from.size, type: from.type, isCompleted: from.isCompleted, tomatoCount: from.tomatoCount)
    }
    
    static func fromDB(model: TomatoTaskEntity) -> TomatoTaskModel {
        return TomatoTaskModel(id: model.tomatoID ?? UUID(), title: model.title!, size: model.size ?? "", type: model.type ?? "", isCompleted: model.isCompleted, tomatoCount: Int(model.tomatoCount))
    }
}
// NB - update the model only through here!

//potentially you can add Color and dueDate to this model
