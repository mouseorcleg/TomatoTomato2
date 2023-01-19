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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TomatoEditView_Previews: PreviewProvider {
    static var previews: some View {
        TomatoEditView(tomatoTask: TomatoTaskModel(id: UUID(), title: "Create EditView", size: "M", type: "develop", isCompleted: false))
    }
}
