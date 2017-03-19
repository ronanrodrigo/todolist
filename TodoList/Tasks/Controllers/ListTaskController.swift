import Foundation
import UIKit

class ListTaskController: UIViewController {

    fileprivate var listTaskView: ListTaskView!
    fileprivate var listTaskDataSource: ListTaskDataSource!
    private var router: TasksRouter

    private lazy var createBarButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTouchAtCreateTask))
    }()

    init(router: TasksRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
        listTaskDataSource = ListTaskDataSource(
            tasks: [],
            deleteTask: { [unowned self] in DeleteTaskUseCaseFactory.make(presenter: self).delete(identifier: $0) },
            updateTask: { [unowned self] in UpdateTaskUseCaseFactory.make(presenter: self).update(task: $0) }
        )
        listTaskView = ListTaskView(dataSource: listTaskDataSource)
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
        fetchTasks()
    }

    private func setSubviews() {
        view.addSubview(listTaskView)
    }

    private func setConstraints() {
        listTaskView.edges(equalToView: view)
    }

    private func setNavigation() {
        navigationItem.setRightBarButton(createBarButton, animated: false)
        title = String.Tasks.List.title
    }

    private func fetchTasks() {
        ListAllTasksUseCaseFactory.make(presenter: self).list()
    }

    @objc private func didTouchAtCreateTask() {
        createBarButton.isEnabled = false
        router.create()
    }

    func show(error: Error) {
        navigationController?.show(message: error.localizedDescription, backgroundColor: .failBackground)
    }

}

extension ListTaskController: ListTasksPresenter {

    func show(tasks: [Task]) {
        listTaskDataSource.update(with: tasks)
        listTaskView.reloadData()
    }

}

extension ListTaskController: DeleteTasksPresenter {

    func deleted(identifier: Double) {
        guard let row = listTaskDataSource.delete(taskWithIdentifier: identifier) else { return }
        listTaskView.removeItem(at: row)
    }

}

extension ListTaskController: UpdateTaskPresenter {

    func updated(task: Task) {
        listTaskDataSource.update(task: task)
    }

}
