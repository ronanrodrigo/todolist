import Foundation
import UIKit

class ListTaskDataSource: NSObject, UITableViewDataSource {

    private var isRegistered = false
    private var tasks: [Task]
    private let deleteTask: ((Double) -> Void)
    
    init(tasks: [Task], deleteTask: @escaping ((Double) -> Void)) {
        self.tasks = tasks
        self.deleteTask = deleteTask
    }

    func update(with tasks: [Task]) {
        self.tasks = tasks
    }

    func delete(taskWithIdentifier identifier: Double) -> Int? {
        guard let taskIndex = tasks.index(where: { $0.identifier == identifier }) else { return nil }
        tasks.remove(at: taskIndex)
        return taskIndex
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

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteTask(tasks[indexPath.row].identifier)
        }
    }

    private func registerCell(at tableView: UITableView) {
        guard isRegistered else {
            tableView.register(TaskItemViewCell.self, forCellReuseIdentifier: TaskItemViewCell.reuseIdentifier)
            isRegistered = true
            return
        }
    }

}
