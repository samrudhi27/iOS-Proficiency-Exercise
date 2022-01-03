//
//  DemoTableViewController.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 22/11/21.
//

import UIKit
import Alamofire
import SnapKit
import DTTableViewManager

class DemoTableViewController: UIViewController, DTTableViewManageable {
    private var dataViewModel = DataViewModel()
    var items = Array<DataFile>()
    var navBarTitle: String = ""
    var tableView: UITableView! = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        manager.register(DataTableViewCell.self)
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
            var data = DataFile()
            for inn in items {
                data.description = inn.description
                data.title = inn.title
                data.imageHref = inn.imageHref
                manager.memoryStorage.addItem(data)
            }
            DispatchQueue.main.async { [self] in
                let navTitle = dataViewModel.tableData.title
                navigationItem.title = "\(navTitle)"
                self.tableView.reloadData()
            }
        }
}
extension DemoTableViewController {
    // applying constraints to tableview, pinning it to view
    func pinTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
         }
    // setting the row height and backgroundcolor
    func configureTableView() {
        tableView.backgroundColor = .gray
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
}
