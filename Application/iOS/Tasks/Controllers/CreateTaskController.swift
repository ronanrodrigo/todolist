import Foundation
import UIKit
import TodoListSharedCocoaTouch

class CreateTaskController: UIViewController {

    private var router: TasksRouter

    private let createTaskView: CreateTaskView = {
        let view = CreateTaskView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var saveBarButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTouchAtSave))
    }()

    init(router: TasksRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
        setSubviews()
        setConstraints()
        setNavigation()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(NSCoder.initCoderError)
    }

    private func setSubviews() {
        view.addSubview(createTaskView)
    }

    private func setConstraints() {
        let margin = view.layoutMarginsGuide
        createTaskView.edges(equalToLayout: margin)
    }

    private func setNavigation() {
        navigationItem.setRightBarButton(saveBarButton, animated: true)
        title = String.Tasks.Create.title
    }

    @objc private func didTouchAtSave() {
        guard let task = createTaskView.generateTask() else { return }
        saveBarButton.isEnabled = false
        CreateTaskUseCaseFactory
            .make(presenter: CreateTaskUIKitPresenterFactory.make(router: router))
            .create(task: task)
    }

}
