//
//  TaskDetailView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 19/01/2023.
//

import SwiftUI

struct TaskDetailView: View {
    
    var tomatoTask: TomatoTaskModel
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("📍Task:")
                        .padding(.leading)
                    Text(tomatoTask.title)
                    Spacer()
                }
                .font(.title2)
                HStack {
                    Text("Type:")
                        .padding(.leading)
                    Text(tomatoTask.type)
                        .padding(5)
                        .background(Color.theme.extra)
                        .foregroundColor(Color.theme.background)
                        .cornerRadius(10)
                    Text("Size:")
                        .padding(.leading)
                    Circle()
                        .frame(width: 32)
                        .foregroundColor(Color.theme.accent)
                        .overlay {
                            Text(tomatoTask.size)
                                .foregroundColor(Color.theme.background)
                        }
                    Spacer()
                }
                .font(.title3)
                
                HStack {
                    Text("Finished, love?")
                        .padding(.leading)
                    Image(systemName: tomatoTask.isCompleted ? "checkmark.circle" : "circle")
                        .foregroundColor(tomatoTask.isCompleted ? Color.theme.accent : Color.primary)
                        .padding(.leading)
                    Text(tomatoTask.isCompleted ? "Yeeees queeeen" : "Not yet")
                    Spacer()
                }
                .font(.title3)
            }
            .padding(.vertical)
            .background(.background)
            .backgroundStyle(.thickMaterial)
            .cornerRadius(10)
            .padding(.horizontal)
        }
        .background(Color.theme.appBackground)
    }
}
    
    
    struct TaskDetailView_Previews: PreviewProvider {
        static var previews: some View {
            TaskDetailView(tomatoTask: TomatoTaskModel(id: UUID(), title: "Megatask", size: "M", type: "mail", isCompleted: false))
        }
    }
