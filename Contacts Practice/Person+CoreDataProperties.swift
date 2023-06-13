//
//  Person+CoreDataProperties.swift
//  Contacts Practice
//
//  Created by Dhiraj on 6/12/23.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var fname: String?
    @NSManaged public var lname: String?
    @NSManaged public var primaryKey: UUID?
    @NSManaged public var phNum: NSSet?
    @NSManaged public var email: NSSet?
    @NSManaged public var address: NSSet?

}

// MARK: Generated accessors for phNum
extension Person {

    @objc(addPhNumObject:)
    @NSManaged public func addToPhNum(_ value: PhoneNumbers)

    @objc(removePhNumObject:)
    @NSManaged public func removeFromPhNum(_ value: PhoneNumbers)

    @objc(addPhNum:)
    @NSManaged public func addToPhNum(_ values: NSSet)

    @objc(removePhNum:)
    @NSManaged public func removeFromPhNum(_ values: NSSet)

}

// MARK: Generated accessors for email
extension Person {

    @objc(addEmailObject:)
    @NSManaged public func addToEmail(_ value: EmailAddress)

    @objc(removeEmailObject:)
    @NSManaged public func removeFromEmail(_ value: EmailAddress)

    @objc(addEmail:)
    @NSManaged public func addToEmail(_ values: NSSet)

    @objc(removeEmail:)
    @NSManaged public func removeFromEmail(_ values: NSSet)

}

// MARK: Generated accessors for address
extension Person {

    @objc(addAddressObject:)
    @NSManaged public func addToAddress(_ value: Address)

    @objc(removeAddressObject:)
    @NSManaged public func removeFromAddress(_ value: Address)

    @objc(addAddress:)
    @NSManaged public func addToAddress(_ values: NSSet)

    @objc(removeAddress:)
    @NSManaged public func removeFromAddress(_ values: NSSet)

}

extension Person : Identifiable {

}
