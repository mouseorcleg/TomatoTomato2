//
//  TomatoEditView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 19/01/2023.
//

import SwiftUI

struct TomatoEditView: View {
    
    var tomatoTask: TomatoTaskModel
    @State var showDialog: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    init(tomatoTask: TomatoTaskModel) {
        self.tomatoTask = tomatoTask
        _textFieldText = State(initialValue: tomatoTask.title)
        _sizePickerSelection = State(initialValue: tomatoTask.size)
        _typePickerSelection = State(initialValue: tomatoTask.type)
    }
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    @State var textFieldText: String
    @State var sizePickerSelection: String
    @State var typePickerSelection: String
    
    var sizePickerOptions: [String] = ["XS", "S", "M", "L", "XL"]
    var typePickerOptions: [String] = ["mail", "develop", "launch", "meet", "", "plan", "research", "review", "test"]
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type the title", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .background(Color.theme.background.opacity(0.85))
                    .cornerRadius(10)
                    .padding()
                
                Picker("Size", selection: $sizePickerSelection) {
                    ForEach(sizePickerOptions, id: \.self) { size in
                        Text(size)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.bottom)
                .frame(height: 45)
                
                Picker("Type", selection: $typePickerSelection) {
                    ForEach(typePickerOptions, id: \.self) { type in
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
        .navigationTitle("✏️ Edit task ")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
        .navigationBarItems(leading: Button("Cancel") {
            showDialog = true
        })
        .navigationBarBackButtonHidden()
        .alert(isPresented: $showDialog) {
            Alert(title: Text("Discard edits?"), primaryButton: .cancel(Text("Go back to editing")), secondaryButton: .default(Text("Discard and exit")) {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    func savedButtonPressed() {
        if thereIsTheTitle() {
            
            listViewModel.updateTaskInDB(model: TomatoTaskModel.fromEdit(model: tomatoTask, title: textFieldText, size: sizePickerSelection, type: typePickerSelection))
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func thereIsTheTitle() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Title of your task should be at least 3 characters long. Type it up 🦾"
            //can add other checks here
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct TomatoEditView_Previews: PreviewProvider {
    static var previews: some View {
        TomatoEditView(tomatoTask: TomatoTaskModel(id: UUID(), title: "Create EditView", size: "M", type: "develop", isCompleted: false, tomatoCount: 1))
    }
}
