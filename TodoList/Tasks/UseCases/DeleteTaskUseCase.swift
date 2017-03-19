import Foundation

struct DeleteTaskUseCase {

    private let gateway: TasksGateway
    private let presenter: DeleteTasksPresenter

    init(gateway: TasksGateway, presenter: DeleteTasksPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }

    func delete(identifier: Double) {
        do {
            try gateway.delete(identifier: identifier) { result in
                switch result {
                case let .success(task):
                    presenter.deleted(identifier: task.identifier)
                case let .fail(error):
                    presenter.show(error: error)
                }
            }
        } catch {
            presenter.show(error: error)
        }
    }

}
