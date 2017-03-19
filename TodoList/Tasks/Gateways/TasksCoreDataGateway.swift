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
        taskCoreData.identifier = Date().timeIntervalSince1970

        do {
            try persistentContainer.viewContext.save()
            completion(Result.success(taskCoreData))
        } catch {
            completion(Result.fail(error))
        }
    }

    func list(completion: ((Result<[Task]>) -> Void)) {
        let fetchTasks = NSFetchRequest<TaskEntityCoreData>(entityName: entityName)

        do {
            let tasks = try persistentContainer.viewContext.fetch(fetchTasks)
            completion(Result.success(tasks))
        } catch {
            completion(Result.fail(error))
        }
    }

    func delete(identifier: Double, completion: ((Result<Task>) -> Void)) throws {
        let fetchTasks = NSFetchRequest<TaskEntityCoreData>(entityName: entityName)
        fetchTasks.predicate = NSPredicate(format: String.Predicate.equal(fieldName: String.identifierPropertyName).format(),
                                           argumentArray: [identifier])

        do {
            let tasks = try persistentContainer.viewContext.fetch(fetchTasks)
            guard let task = tasks.first else { throw TasksError.notFound(identifier: identifier) }
            persistentContainer.viewContext.delete(task)
            completion(Result.success(task))
        } catch {
            completion(Result.fail(error))
        }
    }

}
