//
//  TomatoDBService.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 16/01/2023.
//

import Foundation
import CoreData

class TomatoDataService {
    
    @Published var savedEntities: [TomatoTaskEntity] = []
    
    private let container: NSPersistentContainer
    private let containerName: String = "TomatoTasksContainer"
    private let entityName: String = "TomatoTaskEntity"

    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading CoreData: \(error)")
            }
            self.fetchData()
        }
    }

    // MARK: One and only public fuction
    // Can be called someewhere else in the app
    
    func updateMyTomatoDB(updateFrom: TomatoTaskModel) {
        
        //check if we already have this task in db
        if let entity = savedEntities.first(where: { $0.id == updateFrom.id}) {
                updateData(entity: entity, update: updateFrom)
            } else {
            addData(model: updateFrom)
        }
    }
    
    func goodbyeTask(model: TomatoTaskModel) {
        //TODO: next line of code does not work for some reason
        let entity = savedEntities.first(where: { $0.id == model.id })
        print("I found and entity to delete! \(entity?.id ?? "there shoild be id")")
        deleteData(entity: entity!)
        }
    
    // MARK: Private functions
    // they work only instide this class, can't be called from somewhere else
    
    private func fetchData() {
        let request = NSFetchRequest<TomatoTaskEntity>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching from db: \(error)")
        }
    }

    private func addData(model: TomatoTaskModel) {
        let newTomatoTask = TomatoTaskEntity(context: container.viewContext)
        newTomatoTask.id = model.id
        newTomatoTask.title = model.title
        newTomatoTask.size = model.size
        newTomatoTask.type = model.type
        newTomatoTask.isCompleted = model.isCompleted
        applyChanges()
    }
    
    private func updateData(entity: TomatoTaskEntity, update: TomatoTaskModel) {
        entity.title = update.title
        entity.size = update.size
        entity.type = update.type
        entity.isCompleted = update.isCompleted
        applyChanges()
    }
    
    private func deleteData(entity: TomatoTaskEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }

    private func saveData() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving data to CoreData: \(error)")
        }
    }
    
    private func applyChanges() {
        saveData()
        fetchData()
    }
}



