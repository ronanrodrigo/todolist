import Foundation
import UIKit
import TodoListSharedCocoaTouch

class EditTaskController: UIViewController {

    private var router: TasksRouter
    private let task: Task

    private let formView: CreateTaskView = {
        let view = CreateTaskView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var saveBarButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTouchAtSave))
    }()

    init(router: TasksRouter, task: Task) {
        self.router = router
        self.task = task
        super.init(nibName: nil, bundle: nil)
        setupSubviews()
        setupConstraints()
        setupNavigation()
        setupForm()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(NSCoder.initCoderError)
    }

    private func setupSubviews() {
        view.addSubview(formView)
    }

    private func setupConstraints() {
        let margin = view.layoutMarginsGuide
        formView.edges(equalToLayout: margin)
    }

    private func setupNavigation() {
        navigationItem.setRightBarButton(saveBarButton, animated: true)
        title = String.Tasks.Create.title
    }

    private func setupForm() {
        formView.setupData(task: task)
    }

    @objc private func didTouchAtSave() {
        guard let task = formView.generateTask() else { return }
        saveBarButton.isEnabled = false
        UpdateTaskUseCaseFactory
            .make(presenter: UpdateTaskUIKitPresenterFactory.make(router: router))
            .update(task: task)
    }
}
