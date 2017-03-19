import Foundation

protocol Task {
    var identifier: Double { get }
    var name: String { get }
    var completed: Bool { get }
}
