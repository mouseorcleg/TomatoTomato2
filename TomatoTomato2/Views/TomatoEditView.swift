//
//  TomatoEditView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 19/01/2023.
//

import SwiftUI

struct TomatoEditView: View {
    
    var tomatoTask: TomatoTaskModel
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var repo: DataRepository
    
    @StateObject var tomatoTaskParameters = TomatoTaskParameters()
    @ObservedObject var vm: EditViewModel
    
    init(tomatoTask: TomatoTaskModel, vm: EditViewModel) {
        self.tomatoTask = tomatoTask
        self._vm = ObservedObject(wrappedValue: EditViewModel(tomatoTask: tomatoTask))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type the title", text: $vm.textFieldText)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .background(Color.theme.background.opacity(0.85))
                    .cornerRadius(10)
                    .padding()
                
                Picker("Size", selection: $vm.sizePickerSelection) {
                    ForEach(tomatoTaskParameters.taskSizes, id: \.self) { size in
                        Text(size)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.bottom)
                .frame(height: 45)
                
                Picker("Type", selection: $vm.typePickerSelection) {
                    ForEach(tomatoTaskParameters.taskTypes, id: \.self) { type in
                        Text(type)
                            .foregroundColor(Color.theme.extra)
                    }
                }
                .pickerStyle(.wheel)
                .background(Color.theme.extra.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom)
                
                Button("Save me".uppercased()) {
                    savedButtonPressed()
                }
                .padding(.vertical)
                .font(.headline)
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .background(Color.theme.accent)
                .foregroundColor(Color.theme.background)
                .cornerRadius(10)
                .padding(.horizontal)
            }
        }
        .frame(maxWidth: 500)
        .navigationTitle("✏️ Edit task ")
        .alert(isPresented: $vm.showAlert) {
            vm.getAlert()
        }
        .navigationBarItems(leading: Button("Cancel") {
            vm.showDialog = true
        })
        .navigationBarBackButtonHidden()
        .alert(isPresented: $vm.showDialog) {
            Alert(title: Text("Discard edits?"), primaryButton: .cancel(Text("Go back to editing")), secondaryButton: .default(Text("Discard and exit")) {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    func savedButtonPressed() {
        if vm.thereIsTheTitle() {
            
            repo.updateTaskInDB(model: TomatoTaskModel.fromEdit(model: tomatoTask, title: vm.textFieldText, size: vm.sizePickerSelection, type: vm.typePickerSelection))
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct TomatoEditView_Previews: PreviewProvider {
    static var previews: some View {
        TomatoEditView(tomatoTask: TomatoTaskModel(id: UUID(), title: "Create EditView", size: "M", type: "develop", isCompleted: false, tomatoCount: 1),
                       vm: EditViewModel(tomatoTask: TomatoTaskModel(id: UUID(), title: "Create EditView", size: "M", type: "develop", isCompleted: false, tomatoCount: 1)))
    }
}
