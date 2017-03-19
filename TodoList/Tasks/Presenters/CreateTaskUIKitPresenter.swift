import Foundation

class CreateTaskUIKitPresenter: CreateTaskPresenter {

    private let router: TasksRouter

    init(router: TasksRouter) {
        self.router = router
    }

    func show(created task: Task) {
        dump(task)
        router.list(withMessage: String.Tasks.Create.Message.success)
    }

    func show(error: Error) {
        dump(error)
    }

}
