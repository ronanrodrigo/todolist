import Foundation

public struct TaskEntity: Task {
    public var identifier: Double
    public var name: String
    public var completed: Bool

    public init(identifier: Double, name: String, completed: Bool) {
        self.identifier = identifier
        self.name = name
        self.completed = completed
    }
}
