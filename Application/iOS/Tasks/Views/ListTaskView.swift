import Foundation
import UIKit

class ListTaskView: UIView {

    private var dataSource: ListTaskTableViewDataSource

    private var delegate: ListTaskTableViewDelegate

    private let listTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = .taskListEstimatedRowHeight
        return tableView
    }()

    init(dataSource: ListTaskTableViewDataSource, delegate: ListTaskTableViewDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(frame: .zero)
        setupTableView()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(NSCoder.initCoderError)
    }

    private func setupTableView() {
        listTableView.dataSource = dataSource
        listTableView.delegate = delegate
    }

    private func setupSubviews() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(listTableView)
    }

    private func setupConstraints() {
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
