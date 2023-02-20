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
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(displayP3Red: 0.075, green: 0.501, blue: 0.518, alpha: 0.3)
    }
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    @State var textFieldText: String = ""
    @State var sizePickerSelection: String = "L"
    @State var typePickerSelection: String = "none"
    
    @StateObject var tomatoTaskParameters = TomatoTaskParameters()
    
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
                    ForEach(tomatoTaskParameters.taskSizes, id: \.self) { size in
                        Text(size)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.bottom)
                .frame(height: 45)
                
                Picker("Type", selection: $typePickerSelection) {
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
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func savedButtonPressed() {
        if thereIsTheTitle() {
            
            repo.addTomatoTask(title: textFieldText, size: sizePickerSelection, type: typePickerSelection)
            
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func thereIsTheTitle() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Title of your task should be at least 3 characters long. Type it up 🦾"
            //can add other checks here
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
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
