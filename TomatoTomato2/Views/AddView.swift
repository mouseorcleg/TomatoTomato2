//
//  AddView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var repo: DataRepository
    
    @ObservedObject var addVM: AddViewModel
    @StateObject var ttParameters = TomatoTaskParameters()
    
    init(addVM: AddViewModel) {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(displayP3Red: 0.075, green: 0.501, blue: 0.518, alpha: 0.3)
        self.addVM = addVM
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type the title", text: $addVM.textFieldText)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .background(Color.theme.background.opacity(0.85))
                    .cornerRadius(10)
                    .padding()
                
                Picker("Size", selection: $addVM.sizePickerSelection) {
                    ForEach(ttParameters.taskSizes, id: \.self) { size in
                        Text(size)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.bottom)
                .frame(height: 45)
                
                Picker("Type", selection: $addVM.typePickerSelection) {
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
                .cornerRadius(10)
                .padding(.horizontal)
            }
        } //ScrollView
        .navigationTitle("✏️ New task ")
        .frame(maxWidth: 500)
        .alert(isPresented: $addVM.showAlert) {
            addVM.getAlert()
        }
    }
    
    func savedButtonPressed() {
        if addVM.thereIsTheTitle() {
            
            repo.addTomatoTask(title: addVM.textFieldText, size: addVM.sizePickerSelection, type: addVM.typePickerSelection)
            
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView(addVM: AddViewModel())
        }
        .environmentObject(DataRepository())
    }
}
