//
//  TomatoTimerView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 23/01/2023.
//

import SwiftUI

struct TomatoTimerView: View {
    
    @ObservedObject var vm = TomatoTimerViewModel()
    
    var body: some View {
        
        VStack {
            ZStack {
                Circle()
                    .fill(Color.clear)
                    .frame(height: 250)
                    .overlay(
                        Circle().stroke(Color.theme.accent, lineWidth: 20)
                    )
                
                Circle()
                    .fill(Color.clear)
                    .frame(width: 250, height: 250)
                    .overlay(
                        Circle().trim(from: 0, to: vm.progress())
                            .stroke(
                                style: StrokeStyle(
                                    lineWidth: 20,
                                    lineCap: .round,
                                    lineJoin: .round
                                )
                            )
                            .foregroundColor(Color.theme.extra)
                    ).animation(.easeInOut(duration: 1.3), value: vm.progress())
                
                VStack {
                    Text(vm.timer.isItTimeForBreak ? "Take a break" : "Work session")
                        .fontWeight(.light)
                        .font(.callout)
                    
                    TomatoClockView(counter: vm.timer.counter, countTo: vm.timer.countTo)
                        .padding(.bottom)
                    Button {
                        if vm.timer.timerIsRunning {
                            vm.timer.pauseTimer()
                        } else {
                            vm.timer.startTimer()
                        }
                    } label: {
                        Image(systemName: vm.timer.timerIsRunning ? "pause.circle.fill" : "play.circle.fill")
                            .font(.system(size: 35))
                            .foregroundColor(vm.timer.timerIsRunning ? Color.theme.extra : Color.theme.accent)
                    }
                }
            }
        }
    }
}

struct TomatoTimerView_Previews: PreviewProvider {
    static var previews: some View {
        TomatoTimerView()
    }
}
