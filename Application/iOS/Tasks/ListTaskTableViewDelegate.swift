import Foundation
import UIKit
import TodoListSharedCocoaTouch

class ListTaskTableViewDelegate: NSObject, UITableViewDelegate {

    private let dataProvider: ListTaskDataProvider
    private let router: TasksRouter

    init(dataProvider: ListTaskDataProvider, router: TasksRouter) {
        self.dataProvider = dataProvider
        self.router = router
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = dataProvider.task(at: indexPath)
        router.edit(task: task)
    }

}
