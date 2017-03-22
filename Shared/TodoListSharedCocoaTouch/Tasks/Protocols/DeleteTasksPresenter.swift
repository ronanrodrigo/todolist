import Foundation

public protocol DeleteTasksPresenter {
    func deleted(identifier: Double)
    func show(error: Error)
}
