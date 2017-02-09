//
//  Item+CoreDataProperties.swift
//  DreamLister
//
//  Created by Leo Fontes on 09/02/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var price: Double
    @NSManaged public var detail: String?
    @NSManaged public var title: String?
    @NSManaged public var created: NSDate?
    @NSManaged public var toImage: Image?
    @NSManaged public var toItemType: ItemType?
    @NSManaged public var toStore: Store?

}
