import Foundation
import Cocoa
import TodoListSharedCocoa

class TasksCocoaRouter: TasksRouter {

    private let window: NSWindow
    private var listTaskController: ListTaskController?

    init(window: NSWindow) {
        self.window = window
    }

    func root() {
        listTaskController = ListTaskController(router: self)
        window.contentViewController = listTaskController
    }

    func create() {
    }

    func index() {
    }

    func list() {
    }

    func list(withSuccessMessage message: String) {
        list()
    }

    func list(withFailMessage message: String) {
        list()
    }

    func edit(task: Task) {
    }
}
