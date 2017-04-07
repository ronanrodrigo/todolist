import Foundation
import TodoListSharedCocoaTouch

class UpdateTaskUIKitPresenter: UpdateTaskPresenter {
    private let router: TasksRouter

    init(router: TasksRouter) {
        self.router = router
    }

    func updated(task: Task) {
        router.list(withSuccessMessage: String.Tasks.Create.Message.success)
    }

    func show(error: Error) {
        router.list(withFailMessage: error.localizedDescription)
    }

}
