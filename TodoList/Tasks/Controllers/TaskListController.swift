import Foundation
import UIKit

class TaskListController: UIViewController {

    private let taskListView: TaskListView
    private var router: TasksRouter

    init(router: TasksRouter) {
        self.router = router
        taskListView = TaskListView(dataSource: TaskListDataSource(tasks: []))
        super.init(nibName: nil, bundle: nil)
        setSubviews()
        setConstraints()
        setNavigation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(NSCoder.initCoderError)
    }

    private func setSubviews() {
        view.addSubview(taskListView)
    }

    private func setConstraints() {
        taskListView.edges(equalToView: view)
    }

    private func setNavigation() {
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTouchAtCreateTask))
        navigationItem.setRightBarButton(barButton, animated: true)
        title = String.Tasks.List.title
    }

    @objc private func didTouchAtCreateTask() {
        router.create()
    }
}
