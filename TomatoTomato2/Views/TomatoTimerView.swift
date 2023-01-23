//
//  TomatoTimerView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 23/01/2023.
//

import SwiftUI

struct TomatoTimerView: View {
    
    @ObservedObject var timer = TomatoTimer()
    
    var body: some View {
        
        VStack {
            ZStack {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 250, height: 250)
                    .overlay(
                        Circle().stroke(Color.theme.accent, lineWidth: 20)
                    )
                
                Circle()
                    .fill(Color.clear)
                    .frame(width: 250, height: 250)
                    .overlay(
                        Circle().trim(from: 0, to: progress())
                            .stroke(
                                style: StrokeStyle(
                                    lineWidth: 20,
                                    lineCap: .round,
                                    lineJoin: .round
                                )
                            )
                            .foregroundColor(Color.theme.extra)
                    ).animation(.linear, value: 1)
                
                VStack {
                    
                    Clock(counter: timer.counter, countTo: timer.countTo)
                        .padding(.vertical)
                    Button {
                        if timer.timerIsRunning {
                            timer.pauseTimer()
                        } else {
                            timer.startTimer()
                        }
                    } label: {
                        Image(systemName: timer.timerIsRunning ? "pause.circle.fill" : "play.circle.fill")
                            .font(.system(size: 35))
                            .foregroundColor(timer.timerIsRunning ? Color.theme.extra : Color.theme.accent)
                    }
                }
            }
        }
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(timer.counter) / CGFloat(timer.countTo))
    }
    
}

struct Clock: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        Text(counterToMinutes())
            .font(.system(size: 60))
            .fontWeight(.ultraLight)
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
    
}

struct TomatoTimerView_Previews: PreviewProvider {
    static var previews: some View {
        TomatoTimerView()
    }
}
