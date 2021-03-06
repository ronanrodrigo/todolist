import Foundation

public struct ListAllTasksUseCase {

    private let gateway: TasksGateway
    private let presenter: ListTasksPresenter

    public init(gateway: TasksGateway, presenter: ListTasksPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }

    public func list() {
        gateway.list { result in
            switch result {
            case let .success(tasks):
                presenter.show(tasks: tasks)
            case let .fail(error):
                presenter.show(error: error)
            }
        }
    }

}
