//
//  DemoTableViewController.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 22/11/21.
//
//
//  DemoTableViewController.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 22/11/21.
//

import UIKit

class DemoTableViewController: UIViewController {
    let dataTableView = UITableView()
    private let contacts = DataApi.getContacts() // model
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        view.addSubview(dataTableView)
        
        dataTableView.dataSource = self
        dataTableView.delegate = self
        dataTableView.translatesAutoresizingMaskIntoConstraints = false
       dataTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        dataTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        dataTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        dataTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
        
        dataTableView.register(DataTableViewCell.self, forCellReuseIdentifier: "contactCell")
        view.backgroundColor = .red
    }

    func setUpNavigation() {
     navigationItem.title = "Contacts"
     
    }
   


}

extension DemoTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(contacts.count)
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! DataTableViewCell
        print(contacts[indexPath.row].name)
        cell.datas = contacts[indexPath.row]
      //.textLabel?.text = contacts[indexPath.row].name
      return cell
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 100
    }
    
    
    
}

