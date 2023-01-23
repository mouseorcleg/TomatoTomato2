//
//  TaskDetailView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 19/01/2023.
//

import SwiftUI

struct TaskDetailView: View {
    
    var tomatoTask: TomatoTaskModel
    
    @ObservedObject var tomatoTimer = TomatoTimer()
    @EnvironmentObject var vm: ListViewModel
    
    var body: some View {
        VStack {
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
            } // taskVStack
            .padding(.vertical)
            .background()
            .backgroundStyle(.thickMaterial)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.bottom)
            
            if tomatoTask.isCompleted == false {
                HStack {
                    TomatoTimerView(timer: tomatoTimer)
                        .padding(.vertical)
                }
            }
            
            HStack {
                Text("Tomatos for this task: " + String(repeating: "🍅 ", count: tomatoTask.tomatoCount))
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
            .padding(.top)
            
            Spacer()
            
        }//main VStack
        .background(Color.theme.appBackground)
        .navigationBarItems(
            trailing: NavigationLink("Edit", destination: TomatoEditView(tomatoTask: tomatoTask))
        )
        .onChange(of: tomatoTimer.tomatoCounter) { value in
            vm.updateTaskInDB(model: tomatoTask.plusOneTomato())
        }
        .onDisappear() {
            tomatoTimer.pauseTimer()
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(tomatoTask: TomatoTaskModel(id: UUID(), title: "Create TimerView", size: "L", type: "develop", isCompleted: false, tomatoCount: 2))
    }
}
