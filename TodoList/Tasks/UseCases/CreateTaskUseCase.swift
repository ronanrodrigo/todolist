import Foundation

struct CreateTaskUseCase {

    private let gateway: TasksGateway
    private let presenter: CreateTaskPresenter

    init(gateway: TasksGateway, presenter: CreateTaskPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }

    func create(task: Task) {
        gateway.create(task: task) { result in
            switch result {
            case let .success(task):
                presenter.show(created: task)
            case let .fail(error):
                presenter.show(error: error)
            }
        }
    }
}
