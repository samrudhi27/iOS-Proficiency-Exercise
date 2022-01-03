//
//  DemoTableViewController.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 22/11/21.
//

import UIKit
import Alamofire
import SnapKit

class DemoTableViewController: UIViewController {
    private var dataViewModel = DataViewModel()
    var items = Array<DataFile>()
    var navBarTitle: String = ""
    var dataTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTableView.register(DataTableViewCell.self, forCellReuseIdentifier: "dataCell")
        dataTableView.dataSource = self
        dataTableView.delegate = self
        view.addSubview(dataTableView)
        pinTableView()
        configureTableView()
        callToViewModelForUIUpdate()
    }
    func callToViewModelForUIUpdate() {
            self.dataViewModel =  DataViewModel()
            self.dataViewModel.bindEmployeeViewModelToController = {
                self.updateDataSource()
            }
        }
        func updateDataSource() {
             items = self.dataViewModel.tableData.rows
            DispatchQueue.main.async { [self] in
                let navTitle = dataViewModel.tableData.title
                navigationItem.title = "\(navTitle)"
                self.dataTableView.reloadData()
            }
        }
}
extension DemoTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? DataTableViewCell
        cell?.datas = items[indexPath.row]
        return cell!
    }
}

extension DemoTableViewController {
    // applying constraints to tableview, pinning it to view
    func pinTableView() {
        dataTableView.translatesAutoresizingMaskIntoConstraints = false
        dataTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
         }
    // setting the row height and backgroundcolor
    func configureTableView() {
        dataTableView.backgroundColor = .gray
        dataTableView.rowHeight = UITableView.automaticDimension
        dataTableView.estimatedRowHeight = 100
    }
}
