import Foundation
import UIKit

class ListTaskView: UIView {

    private var dataSource: ListTaskDataSource

    private let listTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = .taskListEstimatedRowHeight
        return tableView
    }()

    init(dataSource: ListTaskDataSource) {
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

    func removeItem(at row: Int) {
        let indexPath = IndexPath(row: row, section: 0)
        listTableView.deleteRows(at: [indexPath], with: .automatic)
    }

}
