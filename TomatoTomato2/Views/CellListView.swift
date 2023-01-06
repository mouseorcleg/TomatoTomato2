//
//  CellListView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

struct CellListView: View {
    
    let task: TomatoTaskModel
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(task.isCompleted ? Color.theme.accent : Color.primary)
            Text(task.title)
            Spacer()
            Text(task.type)
                .padding(5)
                .background(Color.theme.extra)
                .foregroundColor(Color.theme.background)
                .cornerRadius(10)

            Text(task.size)
                .padding(5)
                .background(Color.theme.accent)
                .foregroundColor(Color.theme.background)
                .cornerRadius(20)
                .padding(.trailing)
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct CellListView_Previews: PreviewProvider {
    static var task1 = TomatoTaskModel(title: "Sleep well", size: " L ", type: "Research", isCompleted: true)
    static var task2 = TomatoTaskModel(title: "Wake up", size: "XS", type: "Develop", isCompleted: false)
    
    static var previews: some View {
        Group {
            CellListView(task: task1)
            CellListView(task: task2)
        }
        .previewLayout(.sizeThatFits)
    }
}
