//
//  TaskEntityCoreData+CoreDataProperties.swift
//  Shared
//
//  Created by Ronan R. Nunes on 22/03/17.
//
//

import Foundation
import CoreData


extension TaskEntityCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntityCoreData> {
        return NSFetchRequest<TaskEntityCoreData>(entityName: "TaskEntityCoreData");
    }

    @NSManaged public var name: String
    @NSManaged public var identifier: Double
    @NSManaged public var completed: Bool

}
