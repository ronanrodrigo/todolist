import Foundation
import UIKit

class ListTaskController: UIViewController {

    fileprivate let listTaskView: ListTaskView
    fileprivate let listTaskDataSource = ListTaskDataSource(tasks: [])
    private var router: TasksRouter

    private lazy var createBarButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTouchAtCreateTask))
    }()

    init(router: TasksRouter) {
        self.router = router
        listTaskView = ListTaskView(dataSource: listTaskDataSource)
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

}

extension ListTaskController: ListTasksPresenter {

    func show(tasks: [Task]) {
        listTaskDataSource.update(with: tasks)
        listTaskView.reloadData()
    }

    func show(error: Error) {
        navigationController?.show(message: error.localizedDescription, backgroundColor: .failBackground)
    }
    
}
