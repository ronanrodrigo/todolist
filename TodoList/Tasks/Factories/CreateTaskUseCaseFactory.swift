import Foundation

struct CreateTaskUseCaseFactory {

    static func make(presenter: CreateTaskPresenter) -> CreateTaskUseCase {
        let gateway = TasksCoreDataGatewayFactory.make()
        return CreateTaskUseCase(gateway: gateway, presenter: presenter)
    }

}
