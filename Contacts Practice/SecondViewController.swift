//
//  SecondViewController.swift
//  Contacts Practice
//
//  Created by Dhiraj on 6/12/23.
//

import UIKit

class SecondViewController: UIViewController {

    var viewModel = ViewControllerViewModel()
    //weak var secondViewModel = SecondViewControllerViewModel()
    var person: Person?
    
    
    let imgView : UIView = {
        let v = UIView()
        let img = UIImageView()
        img.image = UIImage(systemName: "person.circle.fill")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 100).isActive = true
        img.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //img.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
        //img.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
        v.addSubview(img)
        return v
    }()
    
    let fnametf : UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .white
    tf.textColor = .systemBlue
    tf.placeholder = "Enter First Name"
    return tf
    }()
    
    let lnametf : UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .white
    tf.textColor = .systemBlue
    tf.placeholder = "Enter Last Name"
    return tf
    }()
    
    let addNumberButton : UIView = {
        let b = UIStackView()
        b.axis = .horizontal
        b.alignment = .fill
        b.distribution = .fill
        b.spacing = 10
        let img = UIImageView()
        img.image = UIImage(systemName: "plus.circle.fill")
        img.widthAnchor.constraint(equalToConstant: 20).isActive = true
        b.addArrangedSubview(img)
        let l = UILabel()
        l.text = "Add Phone Number"
        b.addArrangedSubview(l)
        return b
    }()
    
    let addEmailButton : UIView = {
        let b = UIStackView()
        b.axis = .horizontal
        b.alignment = .fill
        b.distribution = .fill
        b.spacing = 10
        let img = UIImageView()
        img.image = UIImage(systemName: "plus.circle.fill")
        img.widthAnchor.constraint(equalToConstant: 20).isActive = true
        b.addArrangedSubview(img)
        let l = UILabel()
        l.text = "Add Email id"
        b.addArrangedSubview(l)
        return b
    }()
    
    let addAddressButton : UIView = {
        let b = UIStackView()
        b.axis = .horizontal
        b.alignment = .fill
        b.distribution = .fill
        b.spacing = 10
        let img = UIImageView()
        img.image = UIImage(systemName: "plus.circle.fill")
        img.widthAnchor.constraint(equalToConstant: 20).isActive = true
        b.addArrangedSubview(img)
        let l = UILabel()
        l.text = "Add Address"
        b.addArrangedSubview(l)
        return b
    }()
    
    let stack : UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.spacing = 20
        sv.backgroundColor = .white
        sv.axis = .vertical
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let phoneStack : UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.axis = .vertical
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let emailStack : UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.axis = .vertical
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let addressStack : UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.axis = .vertical
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let filler : UIView = {
       let fv = UIView()
        fv.backgroundColor = .white
        //fv.heightAnchor.constraint(equalToConstant: 33).isActive = true
        return fv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        fnametf.text = person?.fname
        lnametf.text = person?.lname
        
        // MARK: Add Action
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveContact))
        self.navigationItem.rightBarButtonItem = saveButton
        
        filler.translatesAutoresizingMaskIntoConstraints = false
        filler.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        imgView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        stack.addArrangedSubview(imgView)
        stack.addArrangedSubview(fnametf)
        stack.addArrangedSubview(lnametf)
        stack.addArrangedSubview(filler)
        stack.addArrangedSubview(phoneStack)
        stack.addArrangedSubview(addNumberButton)
        stack.addArrangedSubview(filler)
        stack.addArrangedSubview(emailStack)
        stack.addArrangedSubview(addEmailButton)
        stack.addArrangedSubview(filler)
        stack.addArrangedSubview(addressStack)
        stack.addArrangedSubview(addAddressButton)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(addNumberClicked(_:)))
        addNumberButton.addGestureRecognizer(gesture)
        
        let g2 = UITapGestureRecognizer(target: self, action: #selector(addEmailClicked(_:)))
        addEmailButton.addGestureRecognizer(g2)
        
        let g3 = UITapGestureRecognizer(target: self, action: #selector(addAddressClicked(_:)))
        addAddressButton.addGestureRecognizer(g3)
        
        
        
        self.view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            stack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            stack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            stack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
        ])
        populatePerson()
    }

    /*
    @objc func addNumberClicked(_ sender: UITapGestureRecognizer){
        print("Pressed")
        let svcvm = SecondViewControllerViewModel()
        svcvm.createPhoneFields()
    }
    */
    
    @objc func addNumberClicked(_ sender: UITapGestureRecognizer){
        createNumberField()
    }
    
    
    
    func createNumberField(input:String? = nil){
        let pstack = UIStackView()
        pstack.distribution = .fill
        pstack.alignment = .fill
        pstack.axis = .horizontal
        pstack.spacing = 20
        pstack.backgroundColor = .white
        
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textColor = .systemBlue
        tf.placeholder = "Enter Phone Number"
        
        let img = UIImageView()
        img.image = UIImage(systemName: "minus.circle.fill")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 20).isActive = true
        img.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        pstack.addArrangedSubview(img)
        pstack.addArrangedSubview(tf)
        phoneStack.addArrangedSubview(pstack)
        
        tf.text = input
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(phoneMinusButtonClicked))
        
        img.isUserInteractionEnabled = true
        pstack.isUserInteractionEnabled = true
        phoneStack.isUserInteractionEnabled = true
        img.addGestureRecognizer(gesture)
        gesture.view?.tag = phoneStack.arrangedSubviews.count - 1
        
    }
    
    @objc func phoneMinusButtonClicked(_ sender: UIGestureRecognizer) {
         
            let c = phoneStack.arrangedSubviews.count
            let tag = sender.view?.tag ?? c-1
            let sremove = phoneStack.arrangedSubviews[tag]
            phoneStack.removeArrangedSubview(sremove)
            sremove.removeFromSuperview()
    }
    
    @objc func addEmailClicked(_ sender: UITapGestureRecognizer){
        createEmailFields()
    }
    
    func createEmailFields(input: String? = nil){
        let pstack = UIStackView()
        pstack.distribution = .fill
        pstack.alignment = .fill
        pstack.axis = .horizontal
        pstack.spacing = 20
        pstack.backgroundColor = .white
        
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textColor = .systemBlue
        tf.placeholder = "Enter Email id"
        
        let img = UIImageView()
        img.image = UIImage(systemName: "minus.circle.fill")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 20).isActive = true
        img.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        tf.text = input
        
        pstack.addArrangedSubview(img)
        pstack.addArrangedSubview(tf)
        emailStack.addArrangedSubview(pstack)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(emailMinusButtonClicked))
        
        img.isUserInteractionEnabled = true
        pstack.isUserInteractionEnabled = true
        emailStack.isUserInteractionEnabled = true
        img.addGestureRecognizer(gesture)
        gesture.view?.tag = emailStack.arrangedSubviews.count - 1
    }
    
    
    @objc func emailMinusButtonClicked(_ sender: UIGestureRecognizer) {
            let c = emailStack.arrangedSubviews.count
            let tag = sender.view?.tag ?? c-1
            let sremove = emailStack.arrangedSubviews[tag]
            emailStack.removeArrangedSubview(sremove)
            sremove.removeFromSuperview()
    }
    
    
    @objc func addAddressClicked(_ sender: UITapGestureRecognizer){
        createAddressFields()
    }
    
    func createAddressFields(input: String? = nil){
        let pstack = UIStackView()
        pstack.distribution = .fill
        pstack.alignment = .fill
        pstack.axis = .horizontal
        pstack.spacing = 20
        pstack.backgroundColor = .white
        
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textColor = .systemBlue
        tf.placeholder = "Enter Address"
        
        let img = UIImageView()
        img.image = UIImage(systemName: "minus.circle.fill")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 20).isActive = true
        img.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        tf.text = input
        
        pstack.addArrangedSubview(img)
        pstack.addArrangedSubview(tf)
        addressStack.addArrangedSubview(pstack)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(addressMinusButtonClicked))
        
        img.isUserInteractionEnabled = true
        pstack.isUserInteractionEnabled = true
        addressStack.isUserInteractionEnabled = true
        img.addGestureRecognizer(gesture)
        gesture.view?.tag = addressStack.arrangedSubviews.count - 1
    }
    
    
    @objc func addressMinusButtonClicked(_ sender: UIGestureRecognizer) {
            let c = addressStack.arrangedSubviews.count
        let tag = sender.view?.tag ?? c-1
        print("Sender:", sender.view?.tag)
        print("C = ", c-1)
            let sremove = addressStack.arrangedSubviews[tag]
            addressStack.removeArrangedSubview(sremove)
            sremove.removeFromSuperview()
    }
    
    @objc func saveContact(){
        DispatchQueue.main.async { [self] in
            
            var phoneNumbers : [String] = []
            for stack in phoneStack.arrangedSubviews{
                if let stack = stack as? UIStackView,
                   let textField = stack.arrangedSubviews[1] as? UITextField,
                   let text = textField.text{
                    phoneNumbers.append(text)
                }
            }
            
            var emailIds : [String] = []
            for stack in emailStack.arrangedSubviews{
                if let stack = stack as? UIStackView,
                   let textField = stack.arrangedSubviews[1] as? UITextField,
                   let text = textField.text{
                    emailIds.append(text)
                }
            }
            
            
            var adds : [String] = []
            for stack in addressStack.arrangedSubviews{
                if let stack = stack as? UIStackView,
                   let textField = stack.arrangedSubviews[1] as? UITextField,
                   let text = textField.text{
                    adds.append(text)
                }
            }

            
            guard person == nil else{
                updatePerson(person: person!, phNums: phoneNumbers, email: emailIds, address: adds)
                return
            }
            let newPerson = viewModel.createNewPerson(fname: fnametf.text, lname: lnametf.text)
            
            for phNum in phoneNumbers{
                viewModel.addPhNum(person: newPerson, num: phNum)
            }
            
            for email in emailIds{
                viewModel.addEmail(person: newPerson, email: email)
            }
            
            for addres in adds{
                viewModel.addAddress(person: newPerson, addr: addres)
            }
        }
        viewModel.getAllPersons()
        print("Save Successful!")
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    func updatePerson(person: Person, phNums: [String], email: [String] , address: [String]) {
        person.fname = fnametf.text
        person.lname = lnametf.text
        
        person.phNum = nil
        person.email = nil
        person.address = nil
        
        for i in phNums{
        viewModel.addPhNum(person: person, num: i)
        }
        
        for j in email{
            viewModel.addEmail(person: person, email: j)
        }
        
        for k in address{
            viewModel.addAddress(person: person, addr: k)
        }
        viewModel.getAllPersons()
    }

    
    func populatePerson(){
        guard let person = person else {
            return
        }

        person.fname = fnametf.text
        person.lname = lnametf.text
        
        if let ph = person.phNum{
            for i in ph{
                if let phone = i as? PhoneNumbers{
                    createNumberField(input: phone.number)
                }
            }
        }
        
        if let em = person.email{
            for i in em{
                if let email = i as? EmailAddress{
                    createEmailFields(input: email.emailId ?? "")
                }
            }
        }
        
        if let ad = person.address{
            for i in ad{
                if let addr = i as? Address{
                    createAddressFields(input: addr.address ?? "")
                }
            }
        }
    }
    
}
