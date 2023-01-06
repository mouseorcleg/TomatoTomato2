//
//  AddView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    @State var sizePickerSelection: Int = 2
    @State var typePickerSelection: String = "Mail"
    var typePickerOptions: [String] = ["Mail", "Develop", "Launch", "Meet", "Plan", "Research", "Review", "Test"]
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type the task", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .background(Color.theme.background)
                    .cornerRadius(20)
                    .padding()
                
                Picker("Size", selection: $sizePickerSelection) {
                    Text("XS").tag(1)
                    Text("S").tag(2)
                    Text("M").tag(3)
                    Text("L").tag(4)
                    Text("XL").tag(5)
                }
                .padding(.bottom)
                .pickerStyle(.segmented)
                .padding()
                .frame(height: 45)
                
                HStack {
                    Text("Type:")
                    Picker("Type", selection: $typePickerSelection) {
                        ForEach(typePickerOptions, id: \.self) { type in
                            Text(type)
                        }
                    }
                    Spacer()
                }
                
                
                
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
