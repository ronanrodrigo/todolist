import Foundation
import Cocoa
import TodoListSharedCocoa

struct TasksCocoaRouterFactory {

    static func make(window: NSWindow) -> TasksRouter {
        return TasksCocoaRouter(window: window)
    }

}
