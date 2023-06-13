//
//  PhoneNumbers+CoreDataProperties.swift
//  Contacts Practice
//
//  Created by Dhiraj on 6/12/23.
//
//

import Foundation
import CoreData


extension PhoneNumbers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneNumbers> {
        return NSFetchRequest<PhoneNumbers>(entityName: "PhoneNumbers")
    }

    @NSManaged public var number: String?
    @NSManaged public var pnum: Person?

}

extension PhoneNumbers : Identifiable {

}
