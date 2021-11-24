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
// MARK:-DemoTableViewController
class DemoTableViewController: UIViewController {
    let dataTableView = UITableView()
    var dta: [DataFile]?
    var tit: String = ""
    let dataResource: DataResource = DataResource()
    // MARK:-ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // fetching data
        dataResource.getData { [self](dataResponses) in
            if dataResponses?.rows !=  nil {
                // fetching the json rows data
                self.dta = dataResponses?.rows
                // fetching the json title
                self.tit = dataResponses!.title
                print("\(self.tit) in handler")
                // setting the navigation title and reloading the data in the main thread
                DispatchQueue.main.async {
                    self.dataTableView.reloadData()
                    navigationItem.title = "\(tit)"
                }
            }
        }
        // adding the tableview to the view
        view.addSubview(dataTableView)
        // view.pin(to: s)
        // setting the datasource and delegate
        dataTableView.dataSource = self
        dataTableView.delegate = self
        // pinning the table view to the view(constraints)
        pinTableView()
        // configuring the table view, setting height and background color
        configureTableView()
    }
}
// MARK: -DemotableViewController extension
extension DemoTableViewController: UITableViewDataSource, UITableViewDelegate {
    // setting numbers of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // print(self.dta?.count ?? 0)
        return self.dta?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DataTableViewCell
        // swiftlint:enable force_cast
        cell.datas = self.dta?[indexPath.row]
     return cell
 }
}
extension DemoTableViewController {
    // applying constraints to tableview, pinning it to view
    func pinTableView() {
        dataTableView.translatesAutoresizingMaskIntoConstraints = false
       dataTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dataTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dataTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dataTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        dataTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        dataTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        dataTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        dataTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
         }
    // setting the row height and backgroundcolor
    func configureTableView() {
        dataTableView.backgroundColor = .gray
        dataTableView.rowHeight = UITableView.automaticDimension
        dataTableView.estimatedRowHeight = 1000
        dataTableView.register(DataTableViewCell.self, forCellReuseIdentifier: "dataCell")
    }
}
