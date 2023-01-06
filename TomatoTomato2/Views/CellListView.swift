//
//  CellListView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

struct CellListView: View {
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text("Create the views")
            Spacer()
        }
    }
}

struct CellListView_Previews: PreviewProvider {
    static var previews: some View {
        CellListView()
    }
}
