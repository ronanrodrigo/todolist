import Foundation
import TodoListSharedCocoaTouch

struct UpdateTaskUseCaseFactory {

    static func make(presenter: UpdateTaskPresenter) -> UpdateTaskUseCase {
        let gateway = TasksCoreDataGatewayFactory.make()
        return UpdateTaskUseCase(gateway: gateway, presenter: presenter)
    }

}
