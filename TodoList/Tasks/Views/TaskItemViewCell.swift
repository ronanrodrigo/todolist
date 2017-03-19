import Foundation
import UIKit

class TaskItemViewCell: UITableViewCell {

    private let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubviews()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(NSCoder.initCoderError)
    }

    private func setSubviews() {
        contentView.addSubview(nameLabel)
    }

    private func setConstraints() {
        nameLabel.edges(equalToLayout: layoutMarginsGuide)
    }

    func setData(task: Task) {
        nameLabel.text = task.name
    }
    
}

extension TaskItemViewCell {
    static let reuseIdentifier = String(describing: TaskItemViewCell.self)
}
