import Foundation

public protocol ListTasksPresenter {
    func show(tasks: [Task])
    func show(error: Error)
}
