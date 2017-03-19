import Foundation
import UIKit

class TasksUIKitRouter: TasksRouter {

    private let window: UIWindow
    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isTranslucent = false
        return navigationController
    }()

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
