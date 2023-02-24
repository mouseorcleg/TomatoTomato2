//
//  TomatoTimerViewModel.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 23/02/2023.
//

import Foundation

class TomatoTimerViewModel: ObservableObject {
    
    @Published var timer = TomatoTimer()
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(timer.counter) / CGFloat(timer.countTo))
    }
    
    func counterToMinutes() -> String {
        let currentTime = timer.countTo - timer.counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
}
