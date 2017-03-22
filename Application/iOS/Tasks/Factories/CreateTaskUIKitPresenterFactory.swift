import Foundation
import TodoListSharedCocoaTouch

struct CreateTaskUIKitPresenterFactory {

    static func make(router: TasksRouter) -> CreateTaskUIKitPresenter {
        return CreateTaskUIKitPresenter(router: router)
    }

}
