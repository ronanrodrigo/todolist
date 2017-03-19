import Foundation
import UIKit

class TaskItemViewCell: UITableViewCell {

    private let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var completedSwitch: UISwitch = {
        let completedSwitch = UISwitch()
        completedSwitch.onTintColor = .black
        completedSwitch.addTarget(self, action: #selector(didChangeCompletedSwitch), for: .valueChanged)
        return completedSwitch
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

    private var updateTask: ((Task) -> Void)?

    private var task: Task? {
        didSet {
            guard let task = task else { return }
            nameLabel.text = task.name
            completedSwitch.isOn = task.completed
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStackView()
        setSubviews()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(NSCoder.initCoderError)
    }

    func setData(task: Task, updateTask: @escaping ((Task) -> Void)) {
        self.task = task
        self.updateTask = updateTask
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

    @objc func didChangeCompletedSwitch() {
        guard let updateTask = updateTask, let task = task else { return }
        updateTask(TaskEntity(identifier: task.identifier, name: task.name, completed: completedSwitch.isOn))
    }
    
}

extension TaskItemViewCell {
    static let reuseIdentifier = String(describing: TaskItemViewCell.self)
}
