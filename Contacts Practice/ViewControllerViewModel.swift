//
//  ViewControllerViewModel.swift
//  Contacts Practice
//
//  Created by Dhiraj on 6/12/23.
//

import Foundation
import UIKit


class ViewControllerViewModel {
    
    weak var vc : ViewController?
    weak var svc: SecondViewController?
    
    func makeView() -> ViewController {
        let viewC = ViewController(viewModel: self)
        vc = viewC
        return viewC
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var allContacts : [Person] = []
    
    func createNewPerson(fname: String? = nil, lname: String? = nil) -> Person{
        let newPerson = Person(context: context)
        newPerson.fname = fname
        newPerson.lname = lname
        newPerson.primaryKey = UUID()
        do {
            try context.save()
            print("Create New Person Successful")
            getAllPersons()
            
        } catch {
            print("Create New Person Error: ",error)
        }
        
        return newPerson
    }
    
    func addPhNum(person: Person, num: String? = nil){
        let pnumClass = PhoneNumbers(context: context)
        pnumClass.number = num
        pnumClass.pnum = person
        do {
            try context.save()
            print("addPhNum Successful")
            getAllPersons()
            
        } catch {
            print("addPhNum Error: ",error)
        }
    }
    
    func addAddress(person: Person, addr: String? = nil){
        let addressClass = Address(context: context)
        addressClass.address = addr
        addressClass.location = person
        do {
            try context.save()
            print("addAddress Successful")
            getAllPersons()
            
        } catch {
            print("addAddress Error: ",error)
        }
    }
    
    func addEmail(person: Person, email: String? = nil){
        let emailClass = EmailAddress(context: context)
        emailClass.emailId = email
        emailClass.eaddress = person
        do {
            try context.save()
            print("addEmail Successful")
            getAllPersons()
            
        } catch {
            print("addEmail Error: ",error)
        }
    }
    
    func deletePerson(person: Person){
        context.delete(person)
        do {
            try context.save()
            print("Delete Successful")
            getAllPersons()
            
        } catch {
            print("Delete Error: ",error)
        }
    }
    
    func getAllPersons(){
        do{
            let items = try context.fetch(Person.fetchRequest())
            allContacts = items
            DispatchQueue.main.async {
                self.vc?.tv.reloadData()
            }
        } catch{
            print("GetAllPersons" ,error)
        }
    }
    
    
    
    
    
}
