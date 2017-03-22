import Foundation
import UIKit
import TodoListSharedCocoaTouch

class CreateTaskView: UIView {

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = String.Tasks.Label.title
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return textField
    }()

    private let completedSwitch: UISwitch = {
        let completedSwitch = UISwitch()
        completedSwitch.onTintColor = .black
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

    private let verticalStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()

    private var dividerView: UIView {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: .divider).isActive = true
        view.backgroundColor = .lightGray
        view.alpha = 0.5
        return view
    }

    init() {
        super.init(frame: .zero)
        setSubviews()
        setStackView()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(NSCoder.initCoderError)
    }

    private func setSubviews() {
        addSubview(verticalStackView)
    }

    private func setStackView() {
        horizontalStackView.addArrangedSubview(nameTextField)
        horizontalStackView.addArrangedSubview(completedSwitch)
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(dividerView)
    }

    private func setConstraints() {
        verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: .defaultMargin).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

    func generateTask() -> Task? {
        guard let taskName = nameTextField.text, taskName != .empty else { return nil }
        return TaskEntity(
            identifier: .newEnityIdentifier,
            name: taskName,
            completed: completedSwitch.isOn)
    }
}
