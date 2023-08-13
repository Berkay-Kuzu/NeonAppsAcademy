//
//  InfoItem.swift
//  InfoAppCoreData
//
//  Created by Berkay Kuzu on 27.06.2023.
//

import CoreData

@objc(InfoItem)
class InfoItem: NSManagedObject {
    
    @NSManaged var id: NSNumber!
    @NSManaged var name: String!
    @NSManaged var surname: String!
    @NSManaged var age: String!
    @NSManaged var email: String!
    @NSManaged var others: String!
    @NSManaged var deletedDate: Date?
    
    
}
