//
//  TomatoTaskParameters.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 20/02/2023.
//

import Foundation

struct TomatoTaskParametrs: Codable {
    var taskSizes: [String]
    var taskTypes: [String]
    
    init(taskSizes: [String], taskTypes: [String]) {
        self.taskSizes = taskSizes
        self.taskTypes = taskTypes
        
        getTaskSizes()
        getTaskTypes()
    }
    
    mutating func getTaskSizes() {
        taskSizes.append(contentsOf: ["XS", "S", "M", "L", "XL"])
    }
    
    mutating func getTaskTypes() {
        taskTypes.append(contentsOf: ["mail", "develop", "launch", "meet", "none", "plan", "research", "review", "test"])
    }
}
