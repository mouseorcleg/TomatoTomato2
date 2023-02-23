//
//  TaskDetailViewModel.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 23/02/2023.
//

import Foundation

class TaskDetailViewModel: ObservableObject {
    
    var tomatoTask: TomatoTaskModel
    @Published var tomatoTimer = TomatoTimer()
    
    init(tomatoTask: TomatoTaskModel) {
        self.tomatoTask = tomatoTask
    }
    
    func getTomatosForDisplay() -> String {
        if tomatoTask.tomatoCount == 0 {
            return String("start the timer to earn tomatos")
        } else {
            return String(repeating: "🍅 ", count: tomatoTask.tomatoCount)
        }
    }
}
