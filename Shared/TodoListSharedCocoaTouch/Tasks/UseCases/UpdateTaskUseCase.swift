import Foundation

public struct UpdateTaskUseCase {

    private let gateway: TasksGateway
    private let presenter: UpdateTaskPresenter

    public init(gateway: TasksGateway, presenter: UpdateTaskPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }

    public func update(task: Task) {
        do {
            try gateway.update(task: task) { result in
                switch result {
                case let .success(task):
                    presenter.updated(task: task)
                case let .fail(error):
                    presenter.show(error: error)
                }
            }
        } catch {
            presenter.show(error: error)
        }
    }
}
