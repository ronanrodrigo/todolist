import Foundation
import TodoListSharedCocoaTouch

class CreateTaskUIKitPresenter: CreateTaskPresenter {

    private let router: TasksRouter

    init(router: TasksRouter) {
        self.router = router
    }

    func show(created task: Task) {
        router.list(withSuccessMessage: String.Tasks.Create.Message.success)
    }

    func show(error: Error) {
        router.list(withFailMessage: error.localizedDescription)
    }

}
