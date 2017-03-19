import Foundation

protocol TasksGateway {
    func create(task: Task, completion: ((Result<Task>) -> Void))
    func list(completion: ((Result<[Task]>) -> Void))
    func delete(identifier: Double, completion: ((Result<Task>) -> Void)) throws
    func update(task: Task, completion: ((Result<Task>) -> Void)) throws
}
