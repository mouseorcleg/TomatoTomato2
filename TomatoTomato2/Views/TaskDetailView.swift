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
                    Text(tomatoTask.isCompleted ? "Yeees 🎉" : "Not yet")
                    Spacer()
                }
                .font(.title3)
            }
            .padding(.vertical)
            .background()
            .backgroundStyle(.thickMaterial)
            .cornerRadius(10)
            .padding(.horizontal)
            
            Spacer(minLength: 15)
            
            VStack {
                Image(systemName: "timer")
                    .frame(width: 340, height: 150, alignment: .bottom)
                    .font(.largeTitle)
                    .foregroundColor(Color.theme.extra)
                    .opacity(0.7)
                    .padding(.bottom)
                Text("Place for a 🍅 timer")
                    .font(.subheadline)
                    .opacity(0.7)
                    .padding(.bottom)
            }
            .background()
            .backgroundStyle(.thinMaterial)
            .cornerRadius(10)
            
            Spacer(minLength: 15)
            
            HStack {
                Text("Tomatos for this task: 🍅 🍅 🍅")
                    .font(.subheadline)
                    .opacity(0.7)
                    .padding(.leading)
                    .padding(.vertical)
                Spacer()
            }
            .background()
            .backgroundStyle(.thinMaterial)
            .cornerRadius(10)
            .padding(.horizontal)
        }
        .background(Color.theme.appBackground)
    }
}


struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(tomatoTask: TomatoTaskModel(id: UUID(), title: "Create DetailView", size: "M", type: "mail", isCompleted: true))
    }
}
