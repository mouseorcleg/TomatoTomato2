//
//  AddView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type the task", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.theme.background)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.vertical)
                Button("Save me".uppercased()) {
                    
                }
                .padding(.vertical)
                .font(.headline)
                .frame(height: 55)
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
