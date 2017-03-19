import Foundation
import UIKit

struct TasksUIKitRouterFactory {

    static func make(window: UIWindow) -> TasksUIKitRouter {
        return TasksUIKitRouter(window: window)
    }
    
}
