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
}
