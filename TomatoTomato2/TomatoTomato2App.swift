//
//  TomatoTomato2App.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 06/01/2023.
//

import SwiftUI

@main
struct TomatoTomato2App: App {
    
    @StateObject var repo: DataRepository = DataRepository()
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(repo)
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
