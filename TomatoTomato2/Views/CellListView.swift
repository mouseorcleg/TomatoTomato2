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
                .font(.body)

            Circle()
                .frame(width: 32)
                .foregroundColor(Color.theme.accent)
                .overlay {
                    Text(task.size)
                        .foregroundColor(Color.theme.background)
                }
        }
        .font(.title3)
    }
}

struct CellListView_Previews: PreviewProvider {
    static var task1 = TomatoTaskModel(id: UUID(), title: "Sleep well", size: "L", type: "research", isCompleted: true)
    static var task2 = TomatoTaskModel(id: UUID(), title: "Wake up", size: "XS", type: "develop", isCompleted: false)
    
    static var previews: some View {
        Group {
            CellListView(task: task1)
            CellListView(task: task2)
        }
        .previewLayout(.sizeThatFits)
    }
}
