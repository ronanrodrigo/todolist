import Foundation

protocol CreateTaskPresenter {
    func show(created task: Task)
    func show(error: Error)
}
