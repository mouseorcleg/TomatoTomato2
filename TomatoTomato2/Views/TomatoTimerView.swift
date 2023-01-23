//
//  TomatoTimerView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 23/01/2023.
//

import SwiftUI

struct TomatoTimerView: View {
    
    @State var counter: Int = 0
    var countTo: Int = 120
    
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
                                lineWidth: 25,
                                lineCap: .round,
                                lineJoin: .round
                                )
                            )
                            .foregroundColor(completed() ? Color.theme.extra: Color.theme.accent)
                    ).animation(.easeInOut(duration: 0.2))
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
    
    var body: some View {
        Text("Oh my God")
    }
    
}

struct TomatoTimerView_Previews: PreviewProvider {
    static var previews: some View {
        TomatoTimerView()
    }
}
