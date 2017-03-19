import Foundation
import UIKit

class TaskItemViewCell: UITableViewCell {

    private let titleLabel: UILabel = {
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
        contentView.addSubview(titleLabel)
    }

    private func setConstraints() {
        titleLabel.edges(equalTo: contentView)
    }
    
}

extension TaskItemViewCell {
    static let reuseIdentifier = String(describing: TaskItemViewCell.self)
}
