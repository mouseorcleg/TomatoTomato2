//
//  TomatoTomato2App.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

@main
struct TomatoTomato2App: App {
    
    @StateObject var dataRepo: DataRepo = DataRepo()
    @StateObject var persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(dataRepo)
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
