import Foundation
import UIKit

class TasksUIKitRouter: TasksRouter {

    private let window: UIWindow
    private var listTaskController: ListTaskController?
    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.tintColor = .black
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

    func list(withSuccessMessage message: String) {
        navigationController.show(message: message, backgroundColor: .successBackground)
        list()
    }

    func list(withFailMessage message: String) {
        navigationController.show(message: message, backgroundColor: .failBackground)
        list()
    }
}
