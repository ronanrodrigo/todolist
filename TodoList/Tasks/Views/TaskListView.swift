import Foundation
import UIKit

class TaskListView: UIView {

    private var dataSource: TaskListDataSource

    private let listTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    init(dataSource: TaskListDataSource) {
        self.dataSource = dataSource
        super.init(frame: .zero)
        setDataSource()
        setSubviews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(NSCoder.initCoderError)
    }

    private func setDataSource() {
        translatesAutoresizingMaskIntoConstraints = false
        listTableView.dataSource = dataSource
    }

    private func setSubviews() {
        addSubview(listTableView)
    }

    private func setConstraints() {
        listTableView.edges(equalToView: self)
    }

    func reloadData() {
        DispatchQueue.main.async { [unowned self] in
            self.listTableView.reloadData()
        }
    }

}
