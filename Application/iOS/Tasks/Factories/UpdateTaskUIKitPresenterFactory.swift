import Foundation
import TodoListSharedCocoaTouch

class UpdateTaskUIKitPresenterFactory {

    static func make(router: TasksRouter) -> UpdateTaskUIKitPresenter {
        return UpdateTaskUIKitPresenter(router: router)
    }

}
