//
//  AddView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    @State var sizePickerSelection: String = "L"
    @State var typePickerSelection: String = "Research"
    
    var sizePickerOptions: [String] = ["XS", "S", "M", "L", "XL"]
    var typePickerOptions: [String] = ["Mail", "Develop", "Launch", "Meet", "Plan", "Research", "Review", "Test"]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(displayP3Red: 0.075, green: 0.501, blue: 0.518, alpha: 0.3)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type the title", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .background(Color.theme.background.opacity(0.85))
                    .cornerRadius(20)
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
                .cornerRadius(20)
                .padding(.horizontal)
                .padding(.bottom)
                
                Button("Save me".uppercased()) {
                    //smth happens
                }
                .padding(.vertical)
                .font(.headline)
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .background(Color.theme.accent)
                .foregroundColor(Color.theme.background)
                .cornerRadius(20)
                .padding(.horizontal)
            }
        }
        .navigationTitle("✏️ New task ")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
    }
}
