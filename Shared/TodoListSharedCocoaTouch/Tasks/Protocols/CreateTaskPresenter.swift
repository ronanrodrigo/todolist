import Foundation

public protocol CreateTaskPresenter {
    func show(created task: Task)
    func show(error: Error)
}
