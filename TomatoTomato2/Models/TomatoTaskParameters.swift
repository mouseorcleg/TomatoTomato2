//
//  TomatoTaskParameters.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 27/02/2023.
//

import Foundation

class TomatoTaskParameters: ObservableObject {
    @Published var taskSizes: [String] = []
    @Published var taskTypes: [String] = []
    
    init() {
        getSizes()
        getTypes()
    }
    
    func getSizes() {
        self.taskSizes.append(contentsOf: ["XS", "S", "M", "L", "XL"])
    }
    
    func getTypes() {
        self.taskTypes.append(contentsOf: ["mail", "develop", "launch", "meet", "none", "plan", "research", "review", "test"])
    }
}
