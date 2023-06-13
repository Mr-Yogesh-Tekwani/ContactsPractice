//
//  Address+CoreDataProperties.swift
//  Contacts Practice
//
//  Created by Dhiraj on 6/12/23.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var address: String?
    @NSManaged public var location: Person?

}

extension Address : Identifiable {

}
