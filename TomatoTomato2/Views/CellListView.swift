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
            Image(systemName: "checkmark.circle")
                .foregroundColor(Color.theme.accent)
            Text(task.title)
            Spacer()
            Text(task.type)
                .foregroundColor(Color.theme.extra)
            Text(task.size)
                .padding()
                .foregroundColor(Color.theme.accent)
        }
    }
}

struct CellListView_Previews: PreviewProvider {
    static var task1 = TomatoTaskModel(title: "Sleep well", size: "XL", type: "Research", isCompleted: true)
    static var task2 = TomatoTaskModel(title: "Wake up", size: "XS", type: "Develop", isCompleted: false)
    
    static var previews: some View {
        Group {
            CellListView(task: task1)
            CellListView(task: task2)
        }
    }
}
