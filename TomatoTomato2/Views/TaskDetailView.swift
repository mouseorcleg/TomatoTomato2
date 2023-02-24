//
//  TaskDetailView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 19/01/2023.
//

import SwiftUI

struct TaskDetailView: View {
    
    var tomatoTask: TomatoTaskModel

    @EnvironmentObject var repo: DataRepository
    @ObservedObject var vm: TaskDetailViewModel
    
    init(tomatoTask: TomatoTaskModel, vm: TaskDetailViewModel) {
        self.tomatoTask = tomatoTask
        self._vm = ObservedObject(wrappedValue: TaskDetailViewModel(tomatoTask: tomatoTask))
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack(alignment: .top) {
                    Text("📍Task:")
                        .padding(.leading)
                        .padding(.bottom)
                        .underline(pattern: .solid, color: Color.theme.appBackground)
                    Text(tomatoTask.title)
                        .lineLimit(3)
                    Spacer()
                }
                .font(.title3)
                
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
                
                
                HStack {
                    Text("Finished, love?")
                        .padding(.leading)
                    Image(systemName: tomatoTask.isCompleted ? "checkmark.circle" : "circle")
                        .foregroundColor(tomatoTask.isCompleted ? Color.theme.accent : Color.primary)
                        .padding(.leading)
                    Text(tomatoTask.isCompleted ? "Yeees 🎉" : "Not yet")
                    Spacer()
                }
            } // taskVStack
            .padding(.vertical)
            .background()
            .backgroundStyle(.thickMaterial)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.bottom)
            .shadow(radius: 5)
            
            if !tomatoTask.isCompleted {
                HStack {
                    TomatoTimerView()
                        .padding(.vertical)
                }
                
            }
            
            HStack {
                Text("Task tomatos: ")
                    .padding(.leading)
                Text(vm.getTomatosForDisplay())
                    .padding(.trailing)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.vertical)
            .background()
            .backgroundStyle(.thickMaterial)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top)
            .shadow(radius: 5)
            
            if vm.tomatoTimer.isItTimeForBreak {
                Text("*To get a tomato you have to go on a break ;-)")
                    .padding()
                    .foregroundColor(.secondary)
                    .opacity(70)
            }
            
            Spacer()
            
        }//main VStack
        .background(Color.theme.appBackground)
        .frame(maxWidth: 500)
        .navigationBarItems(
            trailing: NavigationLink("Edit", destination: TomatoEditView(tomatoTask: tomatoTask, vm: EditViewModel(tomatoTask: tomatoTask)))
        )
        .onChange(of: vm.tomatoTimer.tomatoCounter) { value in
            repo.updateTaskInDB(model: tomatoTask.plusOneTomato())
        }
        .onDisappear() {
            vm.tomatoTimer.pauseTimer()
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(
            tomatoTask: TomatoTaskModel(id: UUID(), title: "Create fantastic and super puper ultra magestic TimerView", size: "L", type: "develop", isCompleted: false, tomatoCount: 0),
            vm: TaskDetailViewModel(tomatoTask: TomatoTaskModel(id: UUID(), title: "Create fantastic and super puper ultra magestic TimerView", size: "L", type: "develop", isCompleted: false, tomatoCount: 0)))
    }
}
