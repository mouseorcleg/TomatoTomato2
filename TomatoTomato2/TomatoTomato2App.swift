//
//  TomatoTomato2App.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

@main
struct TomatoTomato2App: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    @StateObject var addViewModel: AddViewModel = AddViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
            .environmentObject(addViewModel)
        }
    }
}
