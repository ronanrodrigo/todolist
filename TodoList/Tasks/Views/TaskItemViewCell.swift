import Foundation
import UIKit

class TaskItemViewCell: UITableViewCell {

    private let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let completedSwitch: UISwitch = {
        let compltedSwitch = UISwitch()
        return compltedSwitch
    }()

    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = .defaultMargin
        return stackView
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStackView()
        setSubviews()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(NSCoder.initCoderError)
    }

    private func setStackView() {
        horizontalStackView.addArrangedSubview(nameLabel)
        horizontalStackView.addArrangedSubview(completedSwitch)
    }

    private func setSubviews() {
        contentView.addSubview(horizontalStackView)
    }

    private func setConstraints() {
        horizontalStackView.edges(equalToView: contentView, constant: .defaultMargin)
    }

    func setData(task: Task) {
        nameLabel.text = task.name
        completedSwitch.isOn = task.completed
    }
    
}

extension TaskItemViewCell {
    static let reuseIdentifier = String(describing: TaskItemViewCell.self)
}
