import Foundation

protocol TasksRouter: class {
    func root()
    func create()
    func list()
    func list(withMessage message: String)
}
