import Foundation

protocol DeleteTasksPresenter {

    func deleted(identifier: Double)
    func show(error: Error)

}
