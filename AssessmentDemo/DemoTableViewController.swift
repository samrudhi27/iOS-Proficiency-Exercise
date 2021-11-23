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
    // private let contacts = DataApi.getContacts()
    var dta: [DataFile]?
    let dataResource: DataResource = DataResource()
    override func viewDidLoad() {
        super.viewDidLoad()
        dataResource.getData {(dataResponses) in
            if(dataResponses?.rows !=  nil) {
                self.dta = dataResponses?.rows
                DispatchQueue.main.async {
                    self.dataTableView.reloadData()
                }
            }
        }
        setUpNavigation()
        view.addSubview(dataTableView)
        dataTableView.dataSource = self
        dataTableView.delegate = self
        pinTableView()
        dataTableView.backgroundColor = .blue
        configureTableView()
        view.backgroundColor = .red
    }

    func setUpNavigation() {
     navigationItem.title = "Contacts"
    }
}

extension DemoTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(self.dta?.count ?? 0)
        return self.dta?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! DataTableViewCell
        // swiftlint:enable force_cast
        //print(self.dta?[indexPath.row])
        cell.datas = self.dta?[indexPath.row]
      // .textLabel?.text = contacts[indexPath.row].name
     return cell
 }
}
extension DemoTableViewController {
    func pinTableView() {
        dataTableView.translatesAutoresizingMaskIntoConstraints = false
       dataTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dataTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dataTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dataTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
         }
    func configureTableView() {
        dataTableView.estimatedRowHeight = 600
        dataTableView.rowHeight = UITableView.automaticDimension
        dataTableView.register(DataTableViewCell.self, forCellReuseIdentifier: "contactCell")
    }
}
