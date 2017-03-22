import Foundation
import CoreData

public class CoreDataStack {

    public init() {}

    private lazy var container: NSPersistentContainer = {
        guard let frameworkBundle = Bundle(identifier: .identifierCocoaTouchFrameworkBundle),
            let modelURL = frameworkBundle.url(forResource: "TodoList", withExtension: "momd"),
            let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
                fatalError(#function)
        }
        return NSPersistentContainer(name: "TodoList", managedObjectModel: managedObjectModel)
    }()

    public lazy var persistentContainer: NSPersistentContainer = {
        self.container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return self.container
    }()

    public func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
