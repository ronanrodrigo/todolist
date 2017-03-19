import Foundation

struct ListAllTasksUseCaseFactory {

    static func make(presenter: ListTasksPresenter) -> ListAllTasksUseCase {
        let gateway = TasksCoreDataGatewayFactory.make()
        return ListAllTasksUseCase(gateway: gateway, presenter: presenter)
    }

}
