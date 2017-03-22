import Foundation
import Cocoa
import TodoListSharedCocoa

class ListTaskController: NSViewController {
    
    private var router: TasksRouter

    init?(router: TasksRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(NSCoder.initCoderError)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = NSTextField(labelWithString: "Label")
        view.addSubview(label)
    }
}
