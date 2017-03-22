import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        TasksCocoaRouterFactory.make(window: window).root()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }

}

