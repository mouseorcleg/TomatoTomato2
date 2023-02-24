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
    @Published var countTo: Int = 25*60
    @Published var timerIsRunning: Bool = false
    @Published var tomatoCounter: Int = 0
    @Published var isItTimeForBreak: Bool = false

    //TODO: what we can move from here to vm?
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if (self.counter < self.countTo) {
                self.counter += 1
            } else {
                self.timer?.invalidate()
                self.timerIsRunning = false
                self.isItTimeForBreak.toggle()
                self.counter = 0
                if !self.isItTimeForBreak {
                    self.tomatoCounter += 1
                } else {
                    self.countTo = 5*60
                }
            }
        }
        timerIsRunning = true
    }

    func pauseTimer() {
        timer?.invalidate()
        timerIsRunning = false
    }
}
