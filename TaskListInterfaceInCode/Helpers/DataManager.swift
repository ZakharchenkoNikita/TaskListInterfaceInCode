//
//  DataManager.swift
//  TaskListInterfaceInCode
//
//  Created by Nikita on 23.10.21.
//

import UIKit
import CoreData

class DataManager {
    
    static let shared = DataManager()

    private var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "TaskListInterfaceInCode")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
 
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() { }

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {

                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

//MARK: Work with TaskCategory
extension DataManager {
    func fetchTaskCategories() -> [TaskCategory] {
        let fetchRequest: NSFetchRequest<TaskCategory> = TaskCategory.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        var taskCategories: [TaskCategory] = []
        
        do {
            taskCategories = try context.fetch(fetchRequest)
        } catch let error {
            print(error.localizedDescription)
        }
        
        return taskCategories
    }
    
    func save(_ taskCategoryName: String, completionHandler: (TaskCategory) -> Void) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "TaskCategory", in: context) else {
            return
        }
        guard let taskCategory = NSManagedObject(entity: entityDescription, insertInto: context) as? TaskCategory else { return }
        
        taskCategory.name = taskCategoryName
        taskCategory.date = Date()
        completionHandler(taskCategory)
        
        saveContext()
    }

    func deleteTaskCategory(index: Int, taskCategories: [TaskCategory]) {
        context.delete(taskCategories[index] as NSManagedObject)
        saveContext()
    }
}

extension DataManager {
    func fetchTaskList() -> [Task] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        fetchRequest.relationshipKeyPathsForPrefetching = ["taskCategory"]
        var taskList: [Task] = []
        
        do {
            taskList = try context.fetch(fetchRequest)
        } catch let error {
            print(error.localizedDescription)
        }
        
        return taskList
    }
    
    func save(_ taskName: String, taskCategory: TaskCategory, completion: (Task) -> Void) {
        guard let entityDesctription = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
        guard let task = NSManagedObject(entity: entityDesctription, insertInto: context) as? Task else { return }
        
        task.name = taskName
        task.taskCategory = taskCategory
        
        taskCategory.addToTask(task)
        completion(task)
        
        saveContext()
    }
}
