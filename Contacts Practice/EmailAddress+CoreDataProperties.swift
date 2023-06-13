//
//  EmailAddress+CoreDataProperties.swift
//  Contacts Practice
//
//  Created by Dhiraj on 6/12/23.
//
//

import Foundation
import CoreData


extension EmailAddress {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmailAddress> {
        return NSFetchRequest<EmailAddress>(entityName: "EmailAddress")
    }

    @NSManaged public var emailId: String?
    @NSManaged public var eaddress: Person?

}

extension EmailAddress : Identifiable {

}
