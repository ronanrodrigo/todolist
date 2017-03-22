import UIKit
import CoreData
import TodoListSharedCocoaTouch

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var coreDataStack: CoreDataStack = CoreDataStack()

    lazy var persistentContainer: NSPersistentContainer = {
        return self.coreDataStack.persistentContainer
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }

        window.backgroundColor = .white
        window.makeKeyAndVisible()
        TasksUIKitRouterFactory.make(window: window).root()

        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        coreDataStack.saveContext()
    }
 
}

