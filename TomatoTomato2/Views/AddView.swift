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
    
    @StateObject var tomatoTaskParameters = TomatoTaskParameters()
    @ObservedObject var vm = AddViewModel()

    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(displayP3Red: 0.075, green: 0.501, blue: 0.518, alpha: 0.3)
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
        } //ScrollView
        .navigationTitle("✏️ New task ")
        .frame(maxWidth: 500)
        .alert(isPresented: $vm.showAlert) {
            vm.getAlert()
        }
    }
    
    //TODO: Check why environment object doesn't want to work inside view model
    // mb bc it's not a view?

    func savedButtonPressed() {
        if vm.thereIsTheTitle() {
            
            repo.addTomatoTask(title: vm.textFieldText, size: vm.sizePickerSelection, type: vm.typePickerSelection)
            
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(DataRepository())
    }
}
