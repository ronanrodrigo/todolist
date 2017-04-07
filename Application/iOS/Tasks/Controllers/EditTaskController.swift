import Foundation
import UIKit
import TodoListSharedCocoaTouch

class EditTaskController: UIViewController {

    private var router: TasksRouter
    private let task: Task

    private let formTaskView: FormTaskView = {
        let view = FormTaskView()
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
        view.addSubview(formTaskView)
    }

    private func setupConstraints() {
        let margin = view.layoutMarginsGuide
        formTaskView.edges(equalToLayout: margin)
    }

    private func setupNavigation() {
        navigationItem.setRightBarButton(saveBarButton, animated: true)
        title = String.Tasks.Create.title
    }

    private func setupForm() {
        formTaskView.setupData(task: task)
    }

    @objc private func didTouchAtSave() {
        guard let task = formTaskView.generateTask() else { return }
        saveBarButton.isEnabled = false
        UpdateTaskUseCaseFactory
            .make(presenter: UpdateTaskUIKitPresenterFactory.make(router: router))
            .update(task: task)
    }
}
