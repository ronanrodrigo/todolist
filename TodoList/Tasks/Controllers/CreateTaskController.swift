import Foundation
import UIKit

class CreateTaskController: UIViewController {

    private let createTaskView: CreateTaskView = {
        let view = CreateTaskView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        setSubviews()
        setConstraints()
        setNavigation()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(NSCoder.initCoderError)
    }

    private func setSubviews() {
        view.addSubview(createTaskView)
    }

    private func setConstraints() {
        let margin = view.layoutMarginsGuide
        createTaskView.edges(equalToLayout: margin)
    }

    private func setNavigation() {
        title = String.Tasks.Create.title
    }


}
