import Foundation
import UIKit

class ListTaskController: UIViewController {

    private let taskListView: TaskListView
    private var router: TasksRouter

    private lazy var createBarButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTouchAtCreateTask))
    }()

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createBarButton.isEnabled = true
    }

    private func setSubviews() {
        view.addSubview(taskListView)
    }

    private func setConstraints() {
        taskListView.edges(equalToView: view)
    }

    private func setNavigation() {
        navigationItem.setRightBarButton(createBarButton, animated: false)
        title = String.Tasks.List.title
    }

    @objc private func didTouchAtCreateTask() {
        createBarButton.isEnabled = false
        router.create()
    }
}
