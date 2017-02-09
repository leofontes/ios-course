//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Leo Fontes on 09/02/17.
//  Copyright © 2017 Leo Fontes. All rights reserved.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {

    /* Quick easy way to create a timestamp for items */
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate()
    }
}
