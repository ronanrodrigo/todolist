import Foundation

protocol TasksGateway {
    func create(task: Task, completion: ((Result<Task>) -> Void))
    func list(completion: ((Result<[Task]>) -> Void))
}
