//
//  ViewController.swift
//  Contacts Practice
//
//  Created by Dhiraj on 6/12/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Explain code 12 : 18
    var viewModel : ViewControllerViewModel
    
    init(viewModel: ViewControllerViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:  #selector(addButtonClicked))
    
    let stack : UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        return sv
    }()
    
    let tv = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.viewModel.getAllPersons()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "Contacts"
        
        
        let navItems = UINavigationItem(title: "Contacts")
        navItems.rightBarButtonItem = addButton
        
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        navigationBar.items = [navItems]
        
        stack.addArrangedSubview(navigationBar)
        
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.dataSource = self
        tv.delegate = self
        tv.reloadData()
        
        stack.addArrangedSubview(tv)
        self.view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
        
    }

    
    @objc func addButtonClicked(){
        print("Add Button Clicked")
        let svc = SecondViewController()
        navigationController?.pushViewController(svc, animated: true)
    }

}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.allContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tv.dequeueReusableCell(withIdentifier: "Cell") else {return UITableViewCell()}
        cell.textLabel?.text = ("\(viewModel.allContacts[indexPath.row].fname!) \(viewModel.allContacts[indexPath.row].lname!)")
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            viewModel.deletePerson(person: viewModel.allContacts[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let tvc = ThirdViewController()
            tvc.person = viewModel.allContacts[indexPath.row]
            navigationController?.pushViewController(tvc, animated: true)
    }
}
