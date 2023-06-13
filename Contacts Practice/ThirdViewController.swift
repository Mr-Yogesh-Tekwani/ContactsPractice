//
//  ThirdViewController.swift
//  Contacts Practice
//
//  Created by Dhiraj on 6/13/23.
//

import UIKit

class ThirdViewController: UIViewController {

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
    //tf.placeholder = "Enter First Name"
    return tf
    }()
    
    let lnametf : UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .white
    tf.textColor = .systemBlue
    //tf.placeholder = "Enter Last Name"
    return tf
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
    
    
    @objc func viewPhNums(num: String){
        let pstack = UIStackView()
        pstack.distribution = .fill
        pstack.alignment = .fill
        pstack.axis = .horizontal
        pstack.spacing = 20
        pstack.backgroundColor = .white
        
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textColor = .systemBlue
        tf.placeholder = ""
        tf.isUserInteractionEnabled = false
        
        let img = UIImageView()
        img.image = UIImage(systemName: "phone")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 20).isActive = true
        img.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        tf.text = num
        
        pstack.addArrangedSubview(img)
        pstack.addArrangedSubview(tf)
        phoneStack.addArrangedSubview(pstack)
    }
    
    
    @objc func viewEmails(email: String){
        let pstack = UIStackView()
        pstack.distribution = .fill
        pstack.alignment = .fill
        pstack.axis = .horizontal
        pstack.spacing = 20
        pstack.backgroundColor = .white
        
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textColor = .systemBlue
        tf.placeholder = ""
        tf.isUserInteractionEnabled = false
        
        let img = UIImageView()
        img.image = UIImage(systemName: "mail")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 20).isActive = true
        img.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        tf.text = email
        
        pstack.addArrangedSubview(img)
        pstack.addArrangedSubview(tf)
        emailStack.addArrangedSubview(pstack)
    }
    
    @objc func viewAddress(addr: String){
        let pstack = UIStackView()
        pstack.distribution = .fill
        pstack.alignment = .fill
        pstack.axis = .horizontal
        pstack.spacing = 20
        pstack.backgroundColor = .white
        
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textColor = .systemBlue
        tf.placeholder = ""
        tf.isUserInteractionEnabled = false
        
        let img = UIImageView()
        img.image = UIImage(systemName: "mail")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 20).isActive = true
        img.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        tf.text = addr
        
        pstack.addArrangedSubview(img)
        pstack.addArrangedSubview(tf)
        addressStack.addArrangedSubview(pstack)
    }
    
    
    @objc func editContact(){
        let sv = SecondViewController()
        sv.person = person
        self.navigationController?.pushViewController(sv, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        fnametf.text = person?.fname
        lnametf.text = person?.lname
        
        if let ph = person?.phNum{
            for i in ph{
                if let phone = i as? PhoneNumbers{
                    viewPhNums(num: phone.number!)
                }
            }
        }
        
        
        if let em = person?.email{
            for i in em{
                if let email = i as? EmailAddress{
                    viewEmails(email: email.emailId!)
                }
            }
        }
        
        
        if let em = person?.address{
            for i in em{
                if let add = i as? Address{
                    viewAddress(addr: add.address!)
                }
            }
        }
        
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editContact))
        self.navigationItem.rightBarButtonItem = editButton
        
        filler.translatesAutoresizingMaskIntoConstraints = false
        filler.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        imgView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        stack.addArrangedSubview(imgView)
        stack.addArrangedSubview(fnametf)
        stack.addArrangedSubview(lnametf)
        stack.addArrangedSubview(filler)
        stack.addArrangedSubview(phoneStack)
        
        stack.addArrangedSubview(filler)
        stack.addArrangedSubview(emailStack)
        
        stack.addArrangedSubview(filler)
        stack.addArrangedSubview(addressStack)
        
        
        self.view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            stack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            stack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            stack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
        ])
        
    }

    
    
}
