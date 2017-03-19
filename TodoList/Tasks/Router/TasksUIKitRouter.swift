import Foundation
import UIKit

class TasksUIKitRouter: TasksRouter {

    private let window: UIWindow
    private var listTaskController: ListTaskController?
    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isTranslucent = false
        return navigationController
    }()

    init(window: UIWindow) {
        self.window = window
    }

    func root() {
        listTaskController = ListTaskController(router: self)
        guard let listTaskController = listTaskController else { return }
        navigationController.viewControllers = [listTaskController]
        window.rootViewController = navigationController
    }

    func create() {
        let createTaskController = CreateTaskController(router: self)
        createTaskController.view.backgroundColor = .white
        navigationController.pushViewController(createTaskController, animated: true)
    }

    func index() {
        navigationController.popToRootViewController(animated: true)
    }

    func list() {
        guard let listTaskController = listTaskController else { return }
        navigationController.popToViewController(listTaskController, animated: true)
    }

    func list(withMessage message: String) {
        guard let listTaskController = listTaskController else { return }
        navigationController.show(message: message)
        navigationController.popToViewController(listTaskController, animated: true)
    }
}
