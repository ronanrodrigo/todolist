import Foundation

struct CreateTaskUIKitPresenterFactory {

    static func make(router: TasksRouter) -> CreateTaskUIKitPresenter {
        return CreateTaskUIKitPresenter(router: router)
    }

}
