import Foundation

public protocol UpdateTaskPresenter {
    func updated(task: Task)
    func show(error: Error)
}
