//
//  TaskModel.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import Foundation

struct TomatoTaskModel: Identifiable {
    var id = UUID()
    var title: String
    var size: String
    var type: String
    var isCompleted: Bool
}

//potentially you can add Color and dueDate to this model
