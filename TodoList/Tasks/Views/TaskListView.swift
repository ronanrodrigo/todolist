import Foundation
import UIKit

class TaskListView: UIView {

    private let dataSource: UITableViewDataSource

    private let listTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    init(dataSource: UITableViewDataSource) {
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
        listTableView.edges(equalTo: self)
    }

}
