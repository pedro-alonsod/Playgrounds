//
//  User+CoreDataProperties.swift
//  Bow Ties
//
//  Created by Luke Parham on 10/30/16.
//  Copyright © 2016 Razeware. All rights reserved.
//

import Foundation
import CoreData

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User");
    }

    @NSManaged public var name: String?
    @NSManaged public var bowties: NSSet

}

// MARK: Generated accessors for bowties
extension User {

    @objc(addBowtiesObject:)
    @NSManaged public func addToBowties(_ value: Bowtie)

    @objc(removeBowtiesObject:)
    @NSManaged public func removeFromBowties(_ value: Bowtie)

    @objc(addBowties:)
    @NSManaged public func addToBowties(_ values: NSSet)

    @objc(removeBowties:)
    @NSManaged public func removeFromBowties(_ values: NSSet)

}
