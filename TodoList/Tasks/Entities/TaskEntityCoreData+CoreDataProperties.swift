//
//  TaskEntityCoreData+CoreDataProperties.swift
//  TodoList
//
//  Created by Ronan R. Nunes on 19/03/17.
//  Copyright © 2017 Ronan R. Nunes. All rights reserved.
//

import Foundation
import CoreData

extension TaskEntityCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntityCoreData> {
        return NSFetchRequest<TaskEntityCoreData>(entityName: "TaskEntityCoreData");
    }

    @NSManaged public var completed: Bool
    @NSManaged public var name: String
    @NSManaged public var identifier: Double

}
