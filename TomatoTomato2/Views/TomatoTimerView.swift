//
//  TomatoTimerView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 23/01/2023.
//

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct TomatoTimerView: View {
    
    @State var counter: Int = 0
    var countTo: Int = 60*25
    
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
                            .foregroundColor(completed() ? Color.theme.accent: Color.theme.extra)
                    ).animation(.easeInOut(duration: 0.2), value: 1)
                
                Clock(counter: counter, countTo: countTo)
                
            }
        }
        .onReceive(timer) { time in
            if (self.counter < self.countTo) {
                self.counter += 1
            }
        }
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
    
}

struct Clock: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        Text(counterToMinutes())
            .font(.system(size: 50))
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
