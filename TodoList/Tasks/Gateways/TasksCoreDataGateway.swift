import Foundation
import CoreData

class TasksCoreDataGateway: TasksGateway {

    private let entityName = String(describing: TaskEntityCoreData.self)
    private let persistentContainer: NSPersistentContainer

    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
    }

    func create(task: Task, completion: ((Result<Task>) -> Void)) {
        guard let taskCoreData = NSEntityDescription.insertNewObject(forEntityName: entityName, into: persistentContainer.viewContext) as? TaskEntityCoreData else { fatalError(#function) }

        taskCoreData.name = task.name
        taskCoreData.completed = task.completed

        do {
            try persistentContainer.viewContext.save()
            completion(Result.success(taskCoreData))
        } catch {
            completion(Result.fail(error))
        }
    }

}
