import Foundation
import UIKit

class TasksUIKitRouter: TasksRouter {

    private let window: UIWindow
    private let navigationController: UINavigationController = UINavigationController()

    init(window: UIWindow) {
        self.window = window
    }

    func root() {
        navigationController.viewControllers = [TaskListController(router: self)]
        window.rootViewController = navigationController
    }

    @objc func create() {
        let createTaskController = CreateTaskController()
        createTaskController.view.backgroundColor = .white
        navigationController.pushViewController(createTaskController, animated: true)
    }

}
