//
//  AddView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

struct AddView: View {
    
    @State var addVM = AddViewModel()
    @EnvironmentObject var dataRepo: DataRepo
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(displayP3Red: 0.075, green: 0.501, blue: 0.518, alpha: 0.3)
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
                
                Picker("Size", selection: $addVM.sizePickerOptions) {
                    ForEach(TomatoSize.allCases, id: \.self) { size in
                        Text(size.name)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.bottom)
                .frame(height: 45)
                
                Picker("Type", selection: $addVM.typePickerOptions) {
                    ForEach(TomatoType.allCases, id: \.self) { type in
                        Text(type.name)
                            .foregroundColor(Color.theme.extra)
                    }
                }
                .pickerStyle(.wheel)
                .background(Color.theme.extra.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom)
                
                Button("Save me".uppercased()) {
                    addVM.savedButtonPressed()
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
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(DataRepo())
    }
}
