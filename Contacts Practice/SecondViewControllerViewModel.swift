//
//  SecondViewControllerViewModel.swift
//  Contacts Practice
//
//  Created by Dhiraj on 6/12/23.
//

import Foundation
import UIKit

class SecondViewControllerViewModel {
    
    let svc = SecondViewController()
    
    func createPhoneFields(input: String? = nil){
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
        svc.phoneStack.addArrangedSubview(pstack)
        
        tf.text = input
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(phoneMinusButtonClicked))
        
        img.isUserInteractionEnabled = true
        pstack.isUserInteractionEnabled = true
        svc.phoneStack.isUserInteractionEnabled = true
        img.addGestureRecognizer(gesture)
        gesture.view?.tag = svc.phoneStack.arrangedSubviews.count ?? 0
    }
    
    @objc func phoneMinusButtonClicked(_ sender: UIGestureRecognizer) {
        if let tag = sender.view?.tag{
            let sremove = svc.phoneStack.arrangedSubviews[tag]
            svc.phoneStack.removeArrangedSubview(sremove)
            sremove.removeFromSuperview()
        }
    }
}
