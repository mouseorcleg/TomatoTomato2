//
//  TomatoEditView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 19/01/2023.
//

import SwiftUI

struct TomatoEditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var repo: DataRepository
    
    @StateObject var ttParameters = TomatoTaskParameters()
    @ObservedObject var editVM: EditViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type the title", text: $editVM.textFieldText)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .background(Color.theme.background.opacity(0.85))
                    .cornerRadius(10)
                    .padding()
                
                Picker("Size", selection: $editVM.sizePickerSelection) {
                    ForEach(ttParameters.taskSizes, id: \.self) { size in
                        Text(size)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.bottom)
                .frame(height: 45)
                
                Picker("Type", selection: $editVM.typePickerSelection) {
                    ForEach(ttParameters.taskTypes, id: \.self) { type in
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
                .cornerRadius   (10)
                .padding(.horizontal)
            }
        }
        .frame(maxWidth: 500)
        .navigationTitle("✏️ Edit task ")
        .alert(isPresented: $editVM.showAlert) {
            editVM.getAlert()
        }
        .navigationBarItems(leading: Button("Cancel") {
            editVM.showDialog = true
        })
        .navigationBarBackButtonHidden()
        .alert(isPresented: $editVM.showDialog) {
            Alert(title: Text("Discard edits?"), primaryButton: .cancel(Text("Go back to editing")), secondaryButton: .default(Text("Discard and exit")) {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    func savedButtonPressed() {
        if editVM.thereIsTheTitle() {
            
            repo.updateTaskInDB(model: TomatoTaskModel.fromEdit(model: editVM.tomatoTask, title: editVM.textFieldText, size: editVM.sizePickerSelection, type: editVM.typePickerSelection))
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct TomatoEditView_Previews: PreviewProvider {
    static var previews: some View {
        TomatoEditView(editVM: EditViewModel(tomatoTask: TomatoTaskModel(id: UUID(), title: "Create EditView", size: "M", type: "develop", isCompleted: false, tomatoCount: 1)))
    }
}
