//
//  TomatoTimer.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 23/01/2023.
//

import Foundation
import SwiftUI

class TomatoTimer: ObservableObject {
    
    @Published var timer: Timer?
    @Published var counter: Int = 0
    @Published var countTo: Int = 5
    @Published var timerIsRunning: Bool = false
    @Published var tomatoCounter: Int = 0

    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if (self.counter < self.countTo) {
                self.counter += 1
            } else {
                self.timerIsRunning = false
                self.tomatoCounter += 1
            }
        }
        timerIsRunning = true
    }

    func pauseTimer() {
        timer?.invalidate()
        timerIsRunning = false
    }
}
