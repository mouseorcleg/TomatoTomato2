//
//  TomatoClockView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 23/02/2023.
//

import SwiftUI

struct TomatoClockView: View {
    
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

struct TomatoClockView_Previews: PreviewProvider {
    static var previews: some View {
        TomatoClockView(counter: 10, countTo: 50)
    }
}
