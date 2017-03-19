import Foundation

protocol UpdateTaskPresenter {

    func updated(task: Task)
    func show(error: Error)

}
