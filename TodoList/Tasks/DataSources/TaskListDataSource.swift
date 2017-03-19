import Foundation
import UIKit

class TaskListDataSource: NSObject, UITableViewDataSource {

    private var isRegistered = false
    private var tasks: [Task]

    init(tasks: [Task]) {
        self.tasks = tasks
    }

    func update(with tasks: [Task]) {
        self.tasks = tasks
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        registerCell(at: tableView)
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskItemViewCell.reuseIdentifier, for: indexPath)
        guard let listItemCell = cell as? TaskItemViewCell else { return cell }

        listItemCell.setData(task: tasks[indexPath.row])

        return listItemCell
    }

    private func registerCell(at tableView: UITableView) {
        guard isRegistered else {
            tableView.register(TaskItemViewCell.self, forCellReuseIdentifier: TaskItemViewCell.reuseIdentifier)
            isRegistered = true
            return
        }
    }

}
