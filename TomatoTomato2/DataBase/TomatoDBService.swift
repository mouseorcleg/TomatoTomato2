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
    private let containerName: String = "TomatoContainer"
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

    // MARK: public fuctions
    // Can be called someewhere else in the app
    
    //TODO: still a bug here
//    func howDoYouDoTask(model: TomatoTaskModel) {
//        let tomatoEntity = savedEntities.first(where: { (savedEntity) -> Bool in
//            return savedEntity.tomatoID == model.id
//        }) {
//            updateCompletion(entity: tomatoEntity, update: model)
//        }
//    }
    
    func howAreYouTask(model: TomatoTaskModel) {
        if let tomatoEntity = savedEntities.filter({ $0.tomatoID == model.id }).first {
            updateCompletion(entity: tomatoEntity, update: model)
        } else {
            print("Ooops, I did it again - I can't update it")
        }
    }
    
    func findMe(model: TomatoTaskModel) {
        let lookAtThis = savedEntities.filter { (savedEntity) in
            savedEntity.tomatoID == model.id
        }
        print("\(lookAtThis.count)")
    }
    
    func helloTask(model: TomatoTaskModel) {
        addData(model: model)
    }
    
    func goodbyeTask(indexSet: IndexSet) {
        deleteData(indexSet: indexSet)
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
        newTomatoTask.tomatoID = model.id
        newTomatoTask.title = model.title
        newTomatoTask.size = model.size
        newTomatoTask.type = model.type
        newTomatoTask.isCompleted = model.isCompleted
        saveData()
    }
    
//    private func updateData(entity: TomatoTaskEntity, update: TomatoTaskModel) {
//        entity.title = update.title
//        entity.size = update.size
//        entity.type = update.type
//        entity.isCompleted = update.isCompleted
//        saveData()
//    }
    
    private func updateCompletion(entity: TomatoTaskEntity, update: TomatoTaskModel) {
        if entity.tomatoID == update.id {
            entity.isCompleted.toggle()
            saveData()
        } else {
            print("Can't update if they have different id's")
        }
    }
    
    private func deleteData(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }

    private func saveData() {
        do {
            try container.viewContext.save()
            fetchData()
        } catch let error {
            print("Error saving data to CoreData: \(error)")
        }
    }
    
    private func whereIsMySQLite() {
        let path = NSPersistentContainer
            .defaultDirectoryURL()
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding

        print(path ?? "Not found")
    }
}



