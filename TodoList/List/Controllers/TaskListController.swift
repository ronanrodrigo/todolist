import UIKit

class TaskListController: UIViewController {

    private let taskListView: TaskListView

    init() {
        taskListView = TaskListView(dataSource: TaskListDataSource(todoItems: []))
        super.init(nibName: nil, bundle: nil)
        setSubviews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(NSCoder.initCoderError)
    }

    private func setSubviews() {
        view.addSubview(taskListView)
    }

    private func setConstraints() {
        taskListView.edges(equalTo: view)
    }

}
