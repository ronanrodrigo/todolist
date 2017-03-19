import Foundation
import UIKit

class TasksUIKitRouter: TasksRouter {

    private let window: UIWindow
    private let taskListController: TaskListController

    private lazy var navigationController: UINavigationController = {
        return UINavigationController(rootViewController: self.taskListController)
    }()

    init(window: UIWindow) {
        self.window = window
        taskListController = TaskListController()
    }

    func root() {
        window.rootViewController = navigationController
    }

    func list() {
    }

    func create() {
    }

}
